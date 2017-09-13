class Submission < ApplicationRecord
  mount_uploader :screenshot, ScreenshotUploader
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :submission_keywords, dependent: :destroy
  has_many :keywords, through: :submission_keywords

  validates :title, presence: true
  validates :user_id, presence: true
  validates :screenshot, presence: true
  validates :troll, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :funny, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :helpful, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :story, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
end
