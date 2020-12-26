# DB 設計図

## users table

| Column                | Type    | Option      |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password_confirmation | string  | null: false |
| name                  | string  | null: false |
| name(kana)            | string  | null: false |
| birthday              | integer | null: false |

### Association

* has_many :items
* has_many :records
* has_one :addresses


## items table

| Column      | Type       |Option             |
| ----------- | ---------- | ----------------- |
| items.name  | string     | null: false       |
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
| zip.code         | string     | null: false       |
| urban            | references | foreign_key: true |
| city             | string     | null: false       |
| address          | string     | null: false       |
| building         | string     |                   |
| telephone.number | integer    | null: false       |

### Association

* has_one : users
* has_one : items
* has_one : records

## records table

| Column | Type       | Option            |
| ------ | ---------- | ----------------- |
| item   | references | foreign_key :true |

### Association

* has_many : users
* has_one : records
* has_one : items


