class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :cuicui

  validates :user_id, :cuicui_id, presence: true
  validate :user_exists
  validate :cuicui_exists
    
  def user_exists
    unless User.exists?(user_id)
      errors.add(:user_id, "must exist")
    end
  end

  def cuicui_exists
    unless Cuicui.exists?(cuicui_id)
      errors.add(:cuicui_id, "must exist")
    end
  end
end
