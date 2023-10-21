class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.bigint :user_id, null: false
      t.bigint :container_id, null: false
      t.date :date, default: -> { 'CURRENT_DATE' }
      t.integer :record_type, null: false
      t.text :description
      t.bigint :category_id, null: false
      t.decimal :value, null: false, default: 0, precision: 10, scale: 2
      t.boolean :paid, default: false

      t.timestamps
    end

    add_index :records, :user_id
    add_index :records, :container_id
    add_index :records, :category_id
  end
end
