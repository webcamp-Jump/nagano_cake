class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customr
  belongs_to :order, optional: true

  
  def subtotal
    item.price_including_tax * quantity
  end
end
