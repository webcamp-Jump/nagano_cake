class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :cart_items
  validates :price, presence: true
  validates :genre_id, presence: true
  validates :name, presence: true
  validates :image, presence: true
  validates :introduction, presence: true
  def with_tax_price
    # 税率を適切に設定し、税込み価格を計算する
    tax_rate = 0.1  # 例として税率を10%としますが、適切な税率に置き換えてください
    (price * (1 + tax_rate)).to_i  # 価格に税率を加えて整数値に変換する
  end
end