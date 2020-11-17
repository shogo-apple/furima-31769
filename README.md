# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | null: false             |
| encrypted_password | string              | null: false             |
| family_name        | string              | null: false             |
| last_name          | string              | null: false             |
| family_name_kana   | string              | null: false             |
| last_name_kana     | string              | null: false             |
| birth_date         | date                | null: false             |

### Association

* has_many :items
* has_many :purchases

## items table

| Column             | Type       | Options           |
|--------------------|------------|-------------------|
| name               | string     | null: false       |
| introduction       | text       | null: false       |
| category_id        | integer    | null: false       |
| condition_id       | integer    | null: false       |
| delivery_fee_id    | integer    | null: false       |
| shipping_area_id   | integer    | null: false       |
| shipping_days_id   | integer    | null: false       |
| price              | integer    | null: false       |
| user               | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| user        | references | foreign_key: true |
| item        | references | foreign_key: true | 

### Association

- belongs_to :item
- belongs_to :user
- has_one :delivery_address

## delivery_addresses table

| Column           | Type                | Options                 |
|------------------|---------------------|-------------------------|
| postal_code      | string              | null: false             |
| prefectures_id   | integer             | null: false             |
| city             | string              | null: false             |
| home_number      | string              | null: false             |
| apartment_name   | string              |                         |
| phone_number     | string              | null: false             |
| purchase         | references          | foreign_key:true        |

### Association

- belongs_to :purchase