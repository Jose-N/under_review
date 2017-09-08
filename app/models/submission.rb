class Submission < ApplicationRecord
  mount_uploader :screenshot, ScreenshotUploader
  belongs_to :user
  has_many :comments
  has_many :ratings
  has_many :submission_keywords
  has_many :keywords, through: :submission_keywords

  validates :title, presence: true
  validates :user_id, presence: true
  validates :screenshot, presence: true
end
