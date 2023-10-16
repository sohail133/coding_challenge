class CreateDiscountOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :discount_orders do |t|
      t.references :discount_code
      t.references :order

      t.timestamps
    end
  end
end
