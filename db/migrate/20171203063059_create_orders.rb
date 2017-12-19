class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :category
      t.references :user
      t.references :user_address
      t.float :total_price
      t.string :courier_status
      t.integer :voucher_status

      t.timestamps
    end
  end
end
