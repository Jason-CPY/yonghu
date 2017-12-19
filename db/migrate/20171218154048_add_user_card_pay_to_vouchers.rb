class AddUserCardPayToVouchers < ActiveRecord::Migration[5.1]
  def change
  	add_column :vouchers, :user_card_pay, :float, default: 0
  end
end
