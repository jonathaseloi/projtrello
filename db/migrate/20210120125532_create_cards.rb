class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :title
      t.integer :position
      t.text :description
      t.date :dateCreate
      t.date :dateFinish

      t.timestamps
    end
  end
end
