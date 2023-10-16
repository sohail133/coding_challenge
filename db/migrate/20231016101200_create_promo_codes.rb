class CreatePromoCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :promo_codes do |t|
      t.string :name
      t.string :code
      t.datetime :expiry_date

      t.timestamps
    end
  end
end
