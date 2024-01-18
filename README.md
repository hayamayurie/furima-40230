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

- has_many :items dependent: :destroy
- has_many :oder


## items テーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ | 
| name                | string     | null: false                    |
| explanation         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| condition_id        | integer    | null: false                    |
| postage_type_id     | integer    | null: false                    | 
| prefectures_id      | integer    | null: false                    |
| preparation_days_id | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true | 


### Association

- belongs_to :user dependent: :destroy
- has_one :oder

## address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefectures   | integer    | null: false, foreign_key: true |
| city          | string     | null: false                    |
| street        | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| oder          | integer    | null: false, foreign_key: true |

### Association

- has_one :oder


## oder テーブル
| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| item          | integer | null: false, foreign_key: true |
| user          | integer | null: false, foreign_key: true |
| address       | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address



## images テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| image   | string     | null: false                    |
| item    | integer    | null: false, foreign_key: true |

### Association

belongs_to :item

## comments テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| user    | integer    | null: false, foreign_key: true |
| item    | integer    | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
