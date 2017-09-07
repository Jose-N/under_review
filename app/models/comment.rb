class Comment < ApplicationRecord
  has_one :rating
  belongs_to :submission
  # belongs_to :user
  validates :body, presence: true
  validates :user_id, presence: true
end
