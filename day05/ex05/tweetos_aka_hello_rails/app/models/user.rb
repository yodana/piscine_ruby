class User < ApplicationRecord
    has_many :comments
    has_many :cuicuis
    has_many :likes
    validates :name, :email, :since, :country, presence: true
    validates :name, length: { minimum: 2 }
  
    validates :name, exclusion: { in: ["42", "lancelot du lac", "Ruby"], 
                                 message: "%{value} is banished" }
    validates :name, uniqueness: true
    validates :email, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  
    validates :since, numericality: { only_integer: true }

    def fame
        Like.where(cuicui_id: cuicuis.pluck(:id)).count    
    end
end
