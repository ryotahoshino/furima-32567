# DB 設計図

## users table

| Column                | Type    | Option                    |
| --------------------- | ------- | ------------------------- |
| nickname              | string  | null: false               |
| email                 | string  | null: false, unique: true |
| encrypted_password    | string  | null: false               |
| last_name             | string  | null: false               |
| first_name            | string  | null: false               |
| last_name_kana        | string  | null: false               |
| first_name_kana       | string  | null: false               |
| birthday              | date    | null: false               |

### Association

* has_many :items
* has_many :records


## items table

| Column      | Type       |Option             |
| ----------- | ---------- | ----------------- |
| name        | string     | null: false       |
| detail      | text       | null: false       |
| price       | integer    | null: false       |
| user        | references | foreign_key: true |
| state_id    | integer    | null: false       |
| burden_id   | integer    | null: false       |
| origin_id   | integer    | null: false       |
| day_id      | integer    | null: false       |
| category_id | integer    | null: false       |

### Association

* belongs_to : user
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

* belongs_to : record

## records table

| Column | Type       | Option            |
| ------ | ---------- | ----------------- |
| item   | references | foreign_key :true |
| user   | references | foreign_key :true |

### Association

* belongs_to : user
* belongs_to : item
* has_one : address


