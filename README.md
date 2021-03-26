# テーブル設計

## users テーブル

| Colum              | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| name               | string | null: false             |
| nickname           | string | null: false             |
| e-mail             | string | null: false,unique :true|
| encrypted_password | string | null: false             |
| dob                | date   | null: false             |

### Association

- has_many :items
- has_many :users_items

## users_items テーブル

| Colum   | Type        | Options                        |
| ------- | ----------- | ------------------------------ |
| user_id | references  | null: false,foreign_key: true  |
| item_id | references  | null: false,foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :purchase


## items テーブル
| Colum            | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| item_name        | string     | null: false                     |
| introduction     | text       | null: false                     |
| category_id      | integer    | null: false                     |
| condition_id     | integer    | null: false                     |
| charges_id       | integer    | null: false                     |
| area_id          | integer    | null: false                     |
| delivery_time_id | integer    | null: false                     |
| price            | integer    | null: false                     |
| user_id           |references  | null: false,foreign_key: true  |


### Association

- belongs_to :user
- has_many :users_items


## purchase
| Colum            | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |//郵便番号
| prefectures_id   | integer    | null: false                    |//都道府県
| house_number     | string     | null: false                    |//市町村
| building         | string     |                                |//建物名
| phone_number     | string     | null: false                    |


### Association

- has_many :users_items