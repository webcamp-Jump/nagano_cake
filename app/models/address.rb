class Address < ApplicationRecord
    belongs_to :customer
    
  #全て空でないこと
   validates :postal_code, :address, :name, presence: true
  # #郵便番号半角数字で7文字
  # validates :postal_code, format: { with: /\A\d{7}\z/, message: "は半角数字のみで7文字で入力してください" }
  # # 住所は50文字以内
  # validates :address, length: { maximum: 50, message: "は50文字以内で入力してください" }
  # #宛名は漢字とひらがなと全角カタカナで20文字以内
  # validates :name, format: { with: /\A[\p{Han}\p{Hiragana}\p{Katakana}]{1,20}\z/, message: "は漢字、ひらがな、全角カタカナのみで20文字以内で入力してください" }

   def full_address
    '〒' + postal_code + ' ' + address + ' ' + name
   end
    
end
