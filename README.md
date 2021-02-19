# テーブル設計
## Usersテーブル

| Column         | Type   | Options                  |
| ---------------| ------ | -------------------------|
| email          | string | null: false, unique:true |
| password       | string | null: false              |
| nickname       | string | null: false              |
| last_name      | string | null: false              |
| first_name     | string | null: false              |
| kana_last_name | string | null: false              |
| kana_first_name| string | null: false              |
| birthday       | string | null: false              |

### association

- has_many :Items
- has_many :Purchase_records


## Itemsテーブル

| Column             | type     | Options         |
| -------------------| ---------| --------------- |
| item               | string   | null: false     |
| description        | text     | null: false     |
| category           | string   | null: false     |
| condition          | string   | null: false     |
| delivery_fee       | string   | null: false     |
| shipment_source    | string   | null: false     |
| shipment_days      | string   | null: false     |
| price              | string   | null: false     |
| user_id            | reference|foreign_key:true |

### association

- belongs_to :Users
- has_one :Purchase_records

## Destinationsテーブル

| Column                  | Type        | Options          |
| ------------------------| ------------| -----------------|
| shipment_destination    | string      | null: false      |
| postal_code             | string      | null: false      |
| prefectures             | string      | null: false      |
| municipality            | string      | null: false      |
| address                 | string      | null: false      |
| phone_number            | string      | null: false      |
| purchase_records_id     | reference   | foreign_key:true |

### association

- belongs_to :Purchase_records

## Purchase_recordテーブル

| Column    | Type      | Options          |
| --------  | ----------| -----------------|
| user_id   | reference | foreign_key:true |
| item_id   | reference | foreign_key:true |

### association

- belongs_to :items
- belongs_to :Users
- has_one :destinations
