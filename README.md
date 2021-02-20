# テーブル設計
## Usersテーブル

| Column         | Type   | Options                  |
| -------------------------| ------ | -------------------------|
| email                    | string | null: false, unique:true |
| encrypted_password       | string | null: false              |
| nickname                 | string | null: false              |
| last_name                | string | null: false              |
| first_name               | string | null: false              |
| kana_last_name           | string | null: false              |
| kana_first_name          | string | null: false              |
| birthday                 | date   | null: false              |

### association

- has_many :items
- has_many :purchase_records


## Itemsテーブル

| Column                | type       | Options         |
| ----------------------| -----------| --------------- |
| item                  | string     | null: false     |
| description           | text       | null: false     |
| category_id           | integer    | null: false     |
| condition_id          | integer    | null: false     |
| delivery_fee_id       | integer    | null: false     |
| prefecture_id         | integer    | null: false     |
| shipment_days_id      | integer    | null: false     |
| price                 | integer    | null: false     |
| user                  | references |foreign_key:true |

### association

- belongs_to :user
- has_one :purchase_record

## Destinationsテーブル

| Column                  | Type        | Options          |
| ------------------------| ------------| -----------------|
| postal_code             | string      | null: false      |
| prefecture_id           | integer     | null: false      |
| municipality            | string      | null: false      |
| address                 | string      | null: false      |
| building_name           | string      |                  |
| phone_number            | string      | null: false      |
| purchase_record         | references  | foreign_key:true |

### association

- belongs_to :purchase_record

## Purchase_recordテーブル

| Column    | Type      | Options          |
| --------  | ----------| -----------------|
| user      | references| foreign_key:true |
| item      | references| foreign_key:true |

### association

- belongs_to :item
- belongs_to :user
- has_one :destination
