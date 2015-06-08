class Article < ActiveRecord::Base
  has_many :comments

  scope :published, ->{where(status: true)}


  before_save :set_posted_at


  def set_posted_at
    self.posted_at = Date.today
  end
end
