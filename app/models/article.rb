class Article < ActiveRecord::Base

  has_many :comments

  validates :subject, :description, presence: true
  validates :subject,  length:{minimum:2, maximum:100}
  validates :description,  length:{minimum:2, maximum:2000}
  validates :subject, uniqueness: true

  default_scope lambda{ order(created_at: :desc) }
  scope :published, ->{where(status: true)}


  before_save :set_posted_at


  def set_posted_at
    self.posted_at = Date.today
  end

end
