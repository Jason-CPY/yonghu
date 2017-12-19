class AddCityIdToOrders < ActiveRecord::Migration[5.1]
  def change
  	add_reference :orders, :city
  end
end
