class Comment < ApplicationRecord
  has_one :rating
  belongs_to :submission
  belongs_to :user
  accepts_nested_attributes_for :rating
  attr_accessor :rating
  
  validates :user_id, presence: true
end
