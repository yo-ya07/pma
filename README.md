# テーブル設計

## usersテーブル
| Column               | Type   | Options                  |
|----------------------|--------|--------------------------|
| nickname             | string | null: false              |
| email                | string | null: false,unique: true |
| password_digest      | string | null: false              |
| last_name            | string | null: false              |
| first_name           | string | null: false              |
| last_name_kana       | string | null: false              |
| first_name_kana      | string | null: false              |
| birth_day            | date   | null: false              |

### Association
* has_many :passwords
* has_many :creations


## passwordsテーブル
| Column               | Type       | Options                  |
|----------------------|------------|--------------------------|
| login_title          | string     | null: false              |
| registration_email   | string     | null: false,unique: true |
| created_password     | string     | null: false              |
| login_url            | text       | null: false              |
| memo                 | text       |                          |

### Association
* belongs_to :management


## managementsテーブル
| Column               | Type       | Options                  |
|----------------------|------------|--------------------------|
| creation_id          | references | foreign_key: true        |
| user_id              | references | foreign_key: true        |

### Association
* belongs_to :user
* belongs_to :creation
* has_one :password


## creationsテーブル
| Column               | Type       | Options           |
|----------------------|------------|-------------------|
| create_date          | string     | null: false       |
| user                 | references | foreign_key: true |

### Association
* belongs_to :user
* has_one :management