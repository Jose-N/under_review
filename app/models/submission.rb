class Submission < ApplicationRecord
  mount_uploader :screenshot, ScreenshotUploader
  validates :title, presence: true
  validates :user_id, presence: true
  validates :screenshot, presence: true
end
