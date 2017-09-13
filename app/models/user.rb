require 'file_size_validator'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  has_many :submissions
  has_many :comments

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates :username, presence: true, uniqueness: true, length: {minimum: 6, maximum: 24}, format: { with: /^\w+$/, multiline: true }
  validates :email, presence: true, format: { with: /\A^([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})$\z/i, multiline: true }
  validates :avatar, file_size: {maximum: 0.3.megabytes.to_i}
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
end
