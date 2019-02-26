class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles

  validates :user_name, presence: true, length: { maximum: 6 }
end
