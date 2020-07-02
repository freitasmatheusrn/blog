class Article < ApplicationRecord
  has_many :comments
  belongs_to :user
  validates :title, :text, presence: true
  validates :title, length: { in: 6..20 }
  before_validation :set_subtitle, on: :update


  
  def time_read
    self.text.split(" ").size/150
  end

  private
  def set_subtitle
    self.subtitle = "subtitle empty!!! "
  end
  

end
