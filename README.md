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
| details     | text       | null: false       |
| delivery    | reference  | foreign_key: true |
| price       | integer    | null: false       |
| user        | references | foreign_key: true |
| state       | integer    | null: false       |
| burden      | integer    | null: false       |
| origin      | integer    | null: false       |
| days        | integer    | null: false       |
| category    | integer    | null: false       |

### Association

* belongs_to : users
* has_one : record


## addresses table

| Column           | type       | Option            |
| ---------------- | ---------- | ----------------- |
| zip_code         | string     | null: false       |
| urban_id         | integer    | null: false       |
| city             | string     | null: false       |
| address          | string     | null: false       |
| building         | string     |                   |
| telephone_number | string     | null: false       |
| record           | references | foreign_key: true |

### Association

* has_one : record

## records table

| Column | Type       | Option            |
| ------ | ---------- | ----------------- |
| item   | references | foreign_key :true |
| user   | references | foreign_key :true |

### Association

* belongs_to : user
* belongs_to : record
* belongs_to : item


