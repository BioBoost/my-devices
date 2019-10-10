class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :rememberable, :validatable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable

  has_many :devices

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, :confirmation => true, :length => {:within => 6..100}
end
