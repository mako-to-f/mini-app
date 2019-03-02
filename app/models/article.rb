class Article < ApplicationRecord
  belongs_to :user

  validates :content, presence: true

  scope :recent, -> { order("id DESC") }
end
