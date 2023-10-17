class CreateContainers < ActiveRecord::Migration[7.0]
  def change
    create_table :containers do |t|
      t.bigint :user_id, null: false
      t.string :name


      t.timestamps
    end

    add_index :containers, :user_id
  end
end
