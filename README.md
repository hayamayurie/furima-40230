# テーブル設計

## users テーブル
| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |
| first_name            | string | null: false               |
| family_name           | string | null: false               |
| read_first            | string | null: false               |
| read_family           | string | null: false               |
| birth                 | date   | null: false               |

### Association

- has_many :items　
- has_many :orders


## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ | 
| name                | string     | null: false                    |
| explanation         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| condition_id        | integer    | null: false                    |
| postage_type_id     | integer    | null: false                    | 
| prefecture_id       | integer    | null: false                    |
| preparation_day_id  | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true | 


### Association

- belongs_to :user 
- has_one :order

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| street        | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order


## orders テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## comments テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
