# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| name               | string              | null: false               |
| profile            | text                | null: false               |
| my_bike            | string              | null: false               |
| residence          | text                | null: false               |

### Association

* has_many :bikes
* has_many :comments

## bikes table

| Column             | Type       | Options                          |
|-----------------------------------------------------------------|
| title              | string     | null: false                   |
| catch_copy         | text       | null: false                   |
| concept            | text       | null: false                   |
| user               | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_many :comments

## comments table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| content     | text       | null: false                    |
| bike        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association…

- belongs_to :bikes
- belongs_to :user