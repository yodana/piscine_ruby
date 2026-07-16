class Cuicui < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :likers, through: :likes, source: :user
  
  validates :user_id, presence: true
  validates :user_id, numericality: { only_integer: true }
  validate :user_exists

  def users
    likers
  end

  def user_exists
    unless User.exists?(user_id)
      errors.add(:user_id, "must exist")
    end
  end
end
