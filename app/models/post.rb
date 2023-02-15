class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one_attached :image 

  has_many :likes,  dependent: :destroy

  validates :title, :presence=> true 
  validates :description, :presence=> true
  validates :image, :presence=> true 



  def self.search(search)
    if search
      find(:all, :conditions => ["title LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%"])
    else
      find(:all, where("`title` LIKE ?", "%#{title}%"))
    end
  end
end
