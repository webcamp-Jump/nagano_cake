class Customer < ApplicationRecord
  after_save :check_active_status
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses
  has_many :cart_items
  has_many :orders

  #全て空でないこと
   validates :last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :telephone_number, :postal_code, :address, presence: true

  # is_deletedがfalseならtrueを返すようにしている(退会処理)
  def active_for_authentication?
    super && !is_deleted
  end

  # フルネームを返すメソッド
  def name
    "#{last_name} #{first_name}"
  end

  def full_name
    "#{last_name} #{first_name}"
  end

  private

  def check_active_status
   if saved_change_to_is_active? && !is_active
    # 顧客が退会処理を行った場合の処理
    self.update(is_active: false) # 退会ステータスを更新
   end
  end
end