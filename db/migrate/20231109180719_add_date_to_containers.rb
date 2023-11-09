class AddDateToContainers < ActiveRecord::Migration[7.0]
  def change
    add_column :containers, :date, :date, null: false, default: -> { 'CURRENT_DATE' }
  end
end
