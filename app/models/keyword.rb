class Keyword < ApplicationRecord
  has_many :submission_keywords
  has_many :submissions, through: :submission_keywords
  validates :keyword, presence: true
end
