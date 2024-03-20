class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :cart_items
  validates :price, presence: true
  validates :genre_id, presence: true
  validates :name, presence: true, length: { maximum: 20 }
  validates :image, presence: true
  validates :introduction, presence: true, length: { maximum: 70 }

end