class AddCardIdToCheckItems < ActiveRecord::Migration[6.1]
  def change
    add_column :check_items, :card_id, :integer
    add_index :check_items, :card_id
  end
end
