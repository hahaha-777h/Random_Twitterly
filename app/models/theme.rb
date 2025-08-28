class Theme < ApplicationRecord
  has_many :posts
  validates :title, presence: true, length: { maximum: 255 }
end
