class Article < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validates :content, presence: true

  scope :recent, -> { order("id DESC") }
end
