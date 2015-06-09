class ArticlesController < ResourceController

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_params
      params.require(:article).permit(:subject, :description, :status, :posted_at)
    end
end
