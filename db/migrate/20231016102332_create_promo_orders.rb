class CreatePromoOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :promo_orders do |t|
      t.references :promo_code
      t.references :order
      
      t.timestamps
    end
  end
end
