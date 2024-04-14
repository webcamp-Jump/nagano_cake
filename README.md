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

![スクリーンショット (340)](https://github.com/webcamp-Jump/nagano_cake/assets/9004618/74a7140b-5169-4f93-83f4-5c7d5a05008d)


## 実装機能

![スクリーンショット (341)](https://github.com/webcamp-Jump/nagano_cake/assets/9004618/4a371b9c-cf12-4a66-829f-65ef57a9c85b)

## ER図

![スクリーンショット (342)](https://github.com/webcamp-Jump/nagano_cake/assets/9004618/0bc6386d-429b-455f-a7a7-2e781b883fc8)

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


# 使用方法

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

## 製作者

岩永華怜

柴田将吾

聖前友理

森真斗




