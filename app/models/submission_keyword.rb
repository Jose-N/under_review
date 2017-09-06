class SubmissionKeyword < ApplicationRecord
  belongs_to :submission
  belongs_to :keyword
end
