# テーブル設計

## users テーブル
| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| nickname    | string | null: false |
| email       | string | null: false |
| password    | string | null: false |
| first_name  | string | null: false |
| family_name | string | null: false |
| read_first  | string | null: false |
| read_family | string | null: false |
| birth       | date   | null: false |

### Association

- has_many :items dependent: :destroy
- has_many :comments dependent: :destroy
- has-one :oder 


## items テーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ | 
| name                | string     | null: false                    |
| explanation         | text       | null: false                    |
| category            | integer    | null: false                    |
| condition           | integer    | null: false                    |
| postage_type        | integer    | null: false                    | 
| prefectures         | integer    | null: false                    |
| preparation_days    | integer    | null: false                    |
| value               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true | 


### Association

- belongs_to :user dependent: :destroy
- has_many :comments dependent: :destroy
- has_many :images dependent: :destroy


## comments テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| user    | integer    | null: false, foreign_key: true |
| item    | integer    | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

##  odersテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefectures   | integer    | null: false, foreign_key: true |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| user          | integer    | null: false, foreign_key: true |

### Association

- belongs_to :user


## images テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| image   | string     | null: false                    |
| item    | integer    | null: false, foreign_key: true |

### Association

belongs_to :item

