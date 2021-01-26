class AddColumnIdToCards < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :column_id, :integer
    add_index :cards, :column_id
  end
end
