# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | --------------------------|                  
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| profile            | text   | null: false               |
| occupation         | text   | null: false |
| position           | text   | null: false |

### Association

- has_many :comments
- has_many :rooms, through: :room_users
- has_many :messages

## prototypesテーブル

| Column             | Type       | Options                                      |
| ------------------ | ------     | ---------------------------------------------|                  
| title              | string     | null: false                                  |
| concept            | text       | null: false                                  |
| user               | references | null: false, foreign_key: true               |
| catchy_copy        | text       | null: false                                  |

## commentsテーブル

| Column             | Type       | Options                                     |
| ------------------ | ------     | --------------------------------------------|                  
| content            | text       | null: false                                 |
| prototype          | references | null: false, foreign_key: true              |
| user               | references | null: false, foreign_key: true              |
