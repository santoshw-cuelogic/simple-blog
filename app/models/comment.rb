class Comment < ActiveRecord::Base
  belongs_to :article

  validates_format_of :guest_email, :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/, message: "E-Mail is invalid."
  validates :guest_name, :guest_email, :comment, presence: true

  before_save :set_comment_date


  def set_comment_date
    self.comment_date = Date.today
  end

  def self.search(params)
    Article.search(params).published
  end
end
