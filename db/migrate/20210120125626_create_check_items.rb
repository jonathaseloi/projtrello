class CreateCheckItems < ActiveRecord::Migration[6.1]
  def change
    create_table :check_items do |t|
      t.string :text
      t.boolean :checked

      t.timestamps
    end
  end
end
