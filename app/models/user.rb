class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates_presence_of :first_name
  validates_presence_of :last_name
validates :email, presence: true, format: { with: /\A^([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})$\z/i, multiline: true }



  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
end
