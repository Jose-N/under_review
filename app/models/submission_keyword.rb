class SubmissionKeyword < ApplicationRecord
  belongs_to :submission
  belongs_to :keyword

  validates :submission_id, presence: true
  validates :keyword_id, presence: true
end
