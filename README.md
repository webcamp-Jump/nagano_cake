Nagano_cake
====
## 概要

![image](https://github.com/webcamp-Jump/nagano_cake/assets/9004618/a2876a42-3947-4234-8ec3-36199fafc2e0)

長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト開発。

## 案件の背景

元々近隣住民が顧客だったが、昨年始めたInstagramから人気となり、全国から注文が来るようになった。

InstagramのDMやメールで通販の注文を受けていたが、情報管理が煩雑になってきたため、管理機能を含んだ通販サイトを開設しようと思い至った。

## 通販について

- 通販では注文に応じて製作する受注生産型としている。
- 現在通販での注文量は十分に対応可能な量のため、1日の受注量に制限は設けない。
- 送料は1配送につき全国一律800円。
- 友人や家族へのプレゼントなど、注文者の住所以外にも商品を発送できる。
- 支払方法はクレジットカード、銀行振込から選択できる。

## 用語の定義

![スクリーンショット (340)](https://github.com/sslevel5/MyTask/assets/9004618/4bc0016d-3852-4ca1-8666-0a515baabaa0)


## 実装機能

![スクリーンショット (341)](https://github.com/sslevel5/MyTask/assets/9004618/c06907b0-be53-41b9-94d9-d207cdef3e03)

## ER図

![スクリーンショット (342)](https://github.com/sslevel5/MyTask/assets/9004618/7885bc36-07d8-4b55-b8a1-a33c146c62f5)

## 使用技術

![image](https://github.com/webcamp-Jump/nagano_cake/assets/9004618/20f0ab96-f3ef-400c-a475-5afa6c44d465)
![image](https://github.com/webcamp-Jump/nagano_cake/assets/9004618/c5376540-d329-4dae-b997-eb4a6d164489)
![image](https://github.com/webcamp-Jump/nagano_cake/assets/9004618/820ad9e9-4c2f-489a-8434-ff6e81f02db2)
![image](https://github.com/webcamp-Jump/nagano_cake/assets/9004618/21570ae0-f3ed-4179-a330-9c16da6b62e6)
![image](https://github.com/webcamp-Jump/nagano_cake/assets/9004618/20407384-322d-446c-93b5-bb02c840d805)
![image](https://github.com/webcamp-Jump/nagano_cake/assets/9004618/f1c3fa28-1a9e-4ee9-8d41-3887f1dbd55c)
![image](https://github.com/webcamp-Jump/nagano_cake/assets/9004618/0cfad73c-915a-434c-b503-0ddba352ddc6)
![image](https://github.com/webcamp-Jump/nagano_cake/assets/9004618/f10b9e02-8159-4f18-909b-b5e8ca52bf1e)
<img src="https://img.shields.io/badge/-Bootstrap-563D7C.svg?logo=bootstrap&style=flat">


## 使用方法

## インストール
```
$ git clone git@github.com:webcamp-Jump/nagano_cake.git
$ cd nagano_cake
$ rails db:migrate
$ rails db:seed
$ bundle install
```

## テスト

管理者ログインはメールアドレスを【aa@aa】、パスワードは【aaaaaaaa】で使用できます。

管理者ログインページへは、Aboutページの ♥ から遷移できます。

顧客側の場合、新規作成で好きなアカウントを作成して利用が可能です。

## Gem
```
gem 'devise'
gem 'kaminari','~> 1.2.1'
gem 'image_processing', '~> 1.2'
gem "enum_help"
```
[MIT](https://github.com/tcnksm/tool/blob/master/LICENCE)

## Author

[tcnksm](https://github.com/tcnksm)
