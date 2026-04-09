# README

## usersテーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| encrypted_password  | string | null: false |


### Association
- has_many :items
- has_many :purchases
- has_many :comments



## itemsテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| description  | text       | null: false                    |
| price        | integer    | null: false                    |
| user_id      | references | null: false, foreign_key: true |
| status       | integer    | null: false                    |
| category     | integer    | null: false                    |
| condition    | integer    | null: false                    |
| shipping_fee | integer    | null: false                    |
| prefecture   | integer    | null: false                    |
| shipping_day | integer    | null: false                    |


### Association
- belongs_to :user
- has_one :purchase
- has_many :comments


## purchasesテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :address



## addressesテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | integer    | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |
| phone_number | string     | null: false                    |
| purchase_id  | references | null: false, foreign_key: true |


### Association
- belongs_to :purchase



## commentsテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| content      | text       | null: false                    |
| user_id      | references | null: false, foreign_key: true |
| item_id      | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item