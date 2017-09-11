class Submission < ApplicationRecord
  mount_uploader :screenshot, ScreenshotUploader
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :submission_keywords, dependent: :destroy
  has_many :keywords, through: :submission_keywords

  validates :title, presence: true
  validates :user_id, presence: true
  validates :screenshot, presence: true
end
