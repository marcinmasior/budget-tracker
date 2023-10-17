class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.bigint :user_id, null: false
      t.string :name

      t.timestamps
    end

    add_index :categories, :user_id
  end
end
