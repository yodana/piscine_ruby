class Cuicui < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :likers, through: :likes, source: :user
  
  def users
    likers
  end

end
