class Comment < ApplicationRecord
  has_one :rating
  belongs_to :user
  
  validates :user_id, presence: true
end
