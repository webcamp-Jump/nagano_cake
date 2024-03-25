Nagano_cake
====
## 概要

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

![Ruby](https://img.shields.io/badge/-Ruby-CC342D?style=flat-square&logo=Ruby)
![RubyOnRails](https://img.shields.io/badge/-Ruby%20on%20Rails-CC0000?style=flat-square&logo=Ruby+on+Rails)
![image](https://github.com/sslevel5/MyTask/assets/9004618/8a5d38a3-0c56-421f-bb9c-5cd59e8abdce)
![image](https://github.com/sslevel5/MyTask/assets/9004618/a74be429-0578-4a1a-83eb-241f0228abfd)
![image](https://github.com/sslevel5/MyTask/assets/9004618/ec26d585-5a8e-442b-bf13-319a9d0ca09e)
![image](https://github.com/sslevel5/MyTask/assets/9004618/952da8a7-230d-46be-b354-93fb3a5e1754)
![image](https://github.com/sslevel5/MyTask/assets/9004618/eff1b784-7f38-4c81-b5a3-5a68fd362836)
![image](https://github.com/sslevel5/MyTask/assets/9004618/c3520468-7538-4ae4-9532-e112f51c8988)

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

管理者ログインページへは、Aboutページの♥から遷移できます。

顧客側の場合、新規作成で好きなアカウントを作成して利用が可能です。


[MIT](https://github.com/tcnksm/tool/blob/master/LICENCE)

## Author

[tcnksm](https://github.com/tcnksm)
