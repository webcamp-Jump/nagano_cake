Admin.create!(
   email: 'aa@aa',
   password: 'aaaaaaaa'
)# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ユーザーを追加する
customers_data = [
  { email: "test1@example.com", last_name: "山田", first_name: "太郎", last_name_kana: "ヤマダ", first_name_kana: "タロウ", telephone_number: "09012345678", postal_code: "1234567", address: "東京都渋谷区", password: "password123", password_confirmation: "password123" },
  { email: "test2@example.com", last_name: "鈴木", first_name: "花子", last_name_kana: "スズキ", first_name_kana: "ハナコ", telephone_number: "09012345679", postal_code: "2345678", address: "東京都新宿区", password: "password123", password_confirmation: "password123" },
  { email: "test3@example.com", last_name: "田中", first_name: "次郎", last_name_kana: "タナカ", first_name_kana: "ジロウ", telephone_number: "09012345680", postal_code: "3456789", address: "東京都目黒区", password: "password123", password_confirmation: "password123" },
  { email: "test4@example.com", last_name: "佐藤", first_name: "三郎", last_name_kana: "サトウ", first_name_kana: "サブロウ", telephone_number: "09012345681", postal_code: "4567890", address: "東京都品川区", password: "password123", password_confirmation: "password123" },
  { email: "test5@example.com", last_name: "伊藤", first_name: "四郎", last_name_kana: "イトウ", first_name_kana: "シロウ", telephone_number: "09012345682", postal_code: "5678901", address: "東京都港区", password: "password123", password_confirmation: "password123" },
  { email: "test6@example.com", last_name: "加藤", first_name: "五郎", last_name_kana: "カトウ", first_name_kana: "ゴロウ", telephone_number: "09012345683", postal_code: "6789012", address: "東京都台東区", password: "password123", password_confirmation: "password123" },
  { email: "test7@example.com", last_name: "木村", first_name: "六郎", last_name_kana: "キムラ", first_name_kana: "ロクロウ", telephone_number: "09012345684", postal_code: "7890123", address: "東京都豊島区", password: "password123", password_confirmation: "password123" },
  { email: "test8@example.com", last_name: "中村", first_name: "七郎", last_name_kana: "ナカムラ", first_name_kana: "シチロウ", telephone_number: "09012345685", postal_code: "8901234", address: "東京都荒川区", password: "password123", password_confirmation: "password123" },
  { email: "test9@example.com", last_name: "斎藤", first_name: "八郎", last_name_kana: "サイトウ", first_name_kana: "ハチロウ", telephone_number: "09012345686", postal_code: "9012345", address: "東京都中野区", password: "password123", password_confirmation: "password123" },
  { email: "test10@example.com", last_name: "吉田", first_name: "九郎", last_name_kana: "ヨシダ", first_name_kana: "クロウ", telephone_number: "09012345687", postal_code: "0123456", address: "東京都板橋区", password: "password123", password_confirmation: "password123" },
  { email: "test11@example.com", last_name: "小林", first_name: "十郎", last_name_kana: "コバヤシ", first_name_kana: "ジュウロウ", telephone_number: "09012345688", postal_code: "1234567", address: "東京都江戸川区", password: "password123", password_confirmation: "password123" },
  { email: "test12@example.com", last_name: "加藤", first_name: "十一郎", last_name_kana: "カトウ", first_name_kana: "ジュウイチロウ", telephone_number: "09012345689", postal_code: "2345678", address: "東京都葛飾区", password: "password123", password_confirmation: "password123" },
  { email: "test13@example.com", last_name: "田村", first_name: "十二郎", last_name_kana: "タムラ", first_name_kana: "ジュウニロウ", telephone_number: "09012345690", postal_code: "3456789", address: "東京都八王子市", password: "password123", password_confirmation: "password123" },
  { email: "test14@example.com", last_name: "小川", first_name: "十三郎", last_name_kana: "オガワ", first_name_kana: "ジュウサブロウ", telephone_number: "09012345691", postal_code: "4567890", address: "東京都立川市", password: "password123", password_confirmation: "password123" },
  { email: "test15@example.com", last_name: "岡田", first_name: "十四郎", last_name_kana: "オカダ", first_name_kana: "ジュウシロウ", telephone_number: "09012345692", postal_code: "5678901", address: "東京都武蔵野市", password: "password123", password_confirmation: "password123" }
]

customers_data.each do |data|
  Customer.create!(data)
end

# ジャンルを追加する
genres = ['ケーキ', 'クッキー', 'パイ', 'プリン', 'マカロン', 'チーズケーキ', 'タルト', 'ブラウニー', 'ドーナツ', 'アイスクリーム', 'パンケーキ', 'マフィン', 'ゼリー', 'シュークリーム', 'アップルパイ']

genres.each do |genre_name|
  Genre.create(name: genre_name)
end


# ジャンルIDの最小値と最大値を取得
min_genre_id = Genre.minimum(:id)
max_genre_id = Genre.maximum(:id)

# 画像ファイル名の配列を用意（ここでは1から11までの数値を文字列にして用意）
image_files = (1..11).map { |i| "image#{i}.jpg" }

# 商品名の配列を用意
cake_names = [
  "チョコレートケーキ",
  "ストロベリーショートケーキ",
  "モンブラン",
  "フルーツタルト",
  "チーズケーキ",
  "マーブルケーキ",
  "抹茶ロールケーキ",
  "ベリームースケーキ",
  "シフォンケーキ",
  "アップルパイ",
  "パンナコッタ",
  "タルトフロマージュ",
  "ショコラケーキ",
  "モンブランロール",
  "ブルーベリーチーズタルト"
]

# 15個の商品を作成
15.times do
  # ランダムなジャンルID、画像ファイル、価格を選択
  random_genre_id = rand(min_genre_id..max_genre_id)
  random_image_file = image_files.sample
  random_price = rand(1000..5000) # 価格は1000円から5000円の間でランダムに設定
   random_item_name = cake_names.sample

  # 商品のパラメータを作成
  item_params = {
    genre_id: random_genre_id,
    name: random_item_name,
    introduction: "美味しさが満載のケーキ！口の中でとろけるようなスポンジと濃厚なクリームが絶妙にマッチ。贅沢な一口で幸せを味わえます。",
    price: random_price, # ランダムな価格
    is_active: true, # 販売ステータス（true: 販売中, false: 販売停止）
  }

  # 画像をアタッチする
  image_path = Rails.root.join('app', 'assets', 'images', random_image_file)
  image = ActiveStorage::Blob.create_after_upload!(
    io: File.open(image_path),
    filename: random_image_file,
    content_type: 'image/jpeg'
  )

  # 商品を作成し、画像をアタッチする
  item = Item.new(item_params)
  item.image.attach(image)
  item.save!
end
