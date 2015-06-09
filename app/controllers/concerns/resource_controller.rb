class ResourceController < ApplicationController
  extend ActiveSupport::Concern

  before_action :set_record, only: [:show, :edit, :update, :destroy]
  before_filter :set_properties
  before_filter :get_record, :only => [:show, :edit, :update, :destroy]
  before_filter :parse_filters, :only => :index

  helper_method :resource_class
  include ApplicationHelper

  def index
    @record_scope = resource_class.search(params)
  end

  # GET /articles/new
  def new
    @record = resource_class.new
  end

  def create
    @record = resource_class.new(resource_params)

    respond_to do |format|
      if @record.save
        format.html { redirect_to :back, notice: "#{resource_display_name(@record.class)}  was successfully created." }
        format.json { render action: 'show', status: :created, location: @record }
      else
        format.html { render :action => "new" }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @record }
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @record.update(resource_params)
        format.html { redirect_to :back, notice: "#{resource_display_name(@record.class)} was successfully updated." }
        format.json { head :no_content }
      else
        format.js { render :action => "new" }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @record.destroy
    respond_to do |format|
      format.html { redirect_to resource_display_path_name(@record.class) }
      format.json { head :no_content }
    end
  end

  # The resource class which by default is guessed by the controller name. Defaults to Project in ProjectsController.
  def resource_class
    initialize_resources_class_accessors!
  end

  # Allows you to specify what is the parent class.
  def parent_class
    nil
  end

  def set_properties
    get_parent if parent_class
  end

  def get_record
    @record ||= begin
      if @parent
        @parent.send(resource_class.to_s.tableize).find(params[:id])
      else
        resource_class.find(params[:id])
      end
    end
  end

  def get_parent
    @parent ||= parent_class.find(params[parent_class.to_s.foreign_key.to_sym])
  end

  # Initialize resources class accessors
  def initialize_resources_class_accessors!
    # First priority is the namespaced model, e.g. User::Group
    @resource_class ||= begin
      namespaced_class = self.name.sub(/Controller/, '').singularize
      namespaced_class.constantize
    rescue NameError
      nil
    end

    # Second priority is the top namespace model, e.g. EngineName::Article for EngineName::Admin::ArticlesController
    @resource_class ||= begin
      namespaced_classes = self.name.sub(/Controller/, '').split('::')
      namespaced_class = [namespaced_classes.first, namespaced_classes.last].join('::').singularize
      namespaced_class.constantize
    rescue NameError
      nil
    end

    # Third priority the camelcased c, i.e. UserGroup
    @resource_class ||= begin
      camelcased_class = self.name.sub(/Controller/, '').gsub('::', '').singularize
      camelcased_class.constantize
    rescue NameError
      nil
    end

    # Otherwise use the Group class, or fail
    @resource_class ||= begin
      class_name = self.controller_name.classify
      class_name.constantize
    rescue NameError => e
      raise unless e.message.include?(class_name)
      nil
    end

    @resource_class
  end


  #######################
  private
  #######################
  # Using a private method to encapsulate the permissible parameters is
  # just a good pattern since you'll be able to reuse the same permit
  # list between create and update. Also, you can specialize this method
  # with per-user checking of permissible attributes.
  # def resource_params
  # end

  # Use callbacks to share common setup or constraints between actions.
  def set_record
    @record = resource_class.find(params[:id])
  end

  def parse_filters
    params[:filters] = JSON.parse(params[:filters]) unless params[:filters].blank?
  end

end
