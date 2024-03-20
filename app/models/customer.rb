class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses
  has_many :cart_items
  has_many :orders
  # is_deletedがfalseならtrueを返すようにしている(退会処理)
  def active_for_authentication?
    super && !is_deleted
  end

  # フルネームを返すメソッド
  def full_name
    "#{last_name} #{first_name}"
  end
end
