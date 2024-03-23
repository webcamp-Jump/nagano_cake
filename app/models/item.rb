class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre, optional: true
  has_many :cart_items

  validates :genre, presence: { message: "を選択してください" }
  validates :price, presence: true
  validates :name, presence: true, length: { maximum: 20 }
  validates :image, presence: true
  validates :introduction, presence: true, length: { maximum: 70 }
end
