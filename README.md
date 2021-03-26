# テーブル設計

## users テーブル

| Colum              | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| first_name         | string | null: false             |
| family_name        | string | null: false             |
| first_name_kana    | string | null: false             |
| family_name_kana   | string | null: false             |
| email              | string | null: false,unique :true|
| encrypted_password | string | null: false             |
| dob                | date   | null: false             |

### Association

- has_many :items
- has_many :purchase_management

## purchase_management テーブル

| Colum   | Type        | Options                        |
| ------- | ----------- | ------------------------------ |
| user    | references  | null: false,foreign_key: true  |
| item    | references  | null: false,foreign_key: true  |

### Association

- has_one    :user
- belongs_to :item
- has_one    :purchase_management


## items テーブル
| Colum            | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| item_name        | string     | null: false                     |
| introduction     | text       | null: false                     |
| category_id      | integer    | null: false                     |
| condition_id     | integer    | null: false                     |
| charge_id        | integer    | null: false                     |
| area_id          | integer    | null: false                     |
| delivery_time    | integer    | null: false                     |
| price            | integer    | null: false                     |
| user             | references | null: false,foreign_key: true   |


### Association

- belongs_to :user
- has_one :purchase_management


## purchase
| Colum            | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |//郵便番号
| prefectures_id   | integer    | null: false                    |//都道府県
| city             | string     | null: false                    |//市町村
| house_number     | string     | null: false                    |
| building         | string     |                                |//建物名
| phone_number     | string     | null: false                    |
| user             | references | null: false,foreign_key: true  |
| item             | references | null: false,foreign_key: true  |



### Association

- belongs_to :purchase_management