# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | null: false             |
| password           | string              | null: false             |
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
| category           | string     | null: false       |
| condition          | string     | null: false       |
| delivery_fee       | string     | null: false       |
| shipping_area      | string     | null: false       |
| shipping_days      | string     | null: false       |
| user               | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchase

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
| prefectures      | string              | null: false             |
| city             | string              | null: false             |
| home_number      | string              | null: false             |
| apartment_name   | string              |                         |
| phone_number     | string              | null: false             |
| purchase         | references          | foreign_key:true        |

### Association

- belongs_to :delivery_address