class User < ApplicationRecord
  mount_uploader :icon, ImageUploader
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  has_many :products
end
