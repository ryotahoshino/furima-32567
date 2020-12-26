# DB 設計図

## users table

| Column                | Type    | Option      |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| encrypted_password    | string  | null: false |
| name_last_name        | string  | null: false |
| name_first_name       | string  | null: false |
| name_last_name_kana   | string  | null: false |
| name_first_name_kana  | string  | null: false |
| birthday              | data    | null: false |

### Association

* has_many :items
* has_many :records


## items table

| Column      | Type       |Option             |
| ----------- | ---------- | ----------------- |
| items_name  | string     | null: false       |
| instruction | text       | null: false       |
| details     | text       | null: false       |
| delivery    | reference  | foreign_key: true |
| price       | integer    | null: false       |

### Association

* belongs_to : users
* has_one : addresses
* has_one : records


## addresses table

| Column           | type       | Option            |
| ---------------- | ---------- | ----------------- |
| zip_code         | string     | null: false       |
| urban            | string     | null: false       |
| city             | string     | null: false       |
| address          | string     | null: false       |
| building         | string     |                   |
| telephone_number | string     | null: false       |

### Association

* has_one : records

## records table

| Column | Type       | Option            |
| ------ | ---------- | ----------------- |
| item   | references | foreign_key :true |
| user   | references | foreign_key :true |

### Association

* belongs_to : users
* belongs_to : records
* belongs_to : items


