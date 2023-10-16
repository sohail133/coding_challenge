class CreateDiscountCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :discount_codes do |t|
      t.string :name
      t.string :code
      t.datetime :expiry_date

      t.timestamps
    end
  end
end

