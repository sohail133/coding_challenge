class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :size
      t.string :instructions
      t.decimal :price

      t.references :order
      t.timestamps
    end
  end
end