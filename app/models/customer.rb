class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses
  has_many :cart_items
  has_many :orders

  # # 全て空でないこと
  # validates :last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :telephone_number, :postal_code, :address, :is_active, presence: true, on: [:create, :login]
  # # 漢字とひらがな、全角カタカナで10文字以内あること
  # validates :last_name, :first_name, format: { with: /\A[\p{Han}\p{Hiragana}\p{Katakana}]{1,10}\z/, message: "は漢字、ひらがな、全角カタカナのみで10文字以内で入力してください" }
  # # カタカナで15文字以内あること
  # validates :last_name_kana, :first_name_kana, format: { with: /\A[\p{Katakana}ー－]+\z/, message: "はカタカナのみで15文字以内で入力してください" }
  # # メールアドレス
  # validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "は有効な形式で入力してください" }
  # #郵便番号半角数字で7文字
  # validates :postal_code, format: { with: /\A\d{7}\z/, message: "は半角数字のみで7文字で入力してください" }
  # # 住所は50文字以内
  # validates :address, length: { maximum: 50, message: "は50文字以内で入力してください" }
  # # 電話番号は半角数字のみで11文字以内
  # validates :telephone_number, format: { with: /\A\d{1,11}\z/, message: "は半角数字のみで11文字以内で入力してください" }
  # # パスワード 半角英数字６文字以上、確認用と同じであること
  # validates :password, :encrypted_password, length: { minimum: 6 }, format: { with: /\A[a-zA-Z0-9]+\z/, message: "は半角英数字のみで入力してください" }, on: [:create, :login]


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

end
