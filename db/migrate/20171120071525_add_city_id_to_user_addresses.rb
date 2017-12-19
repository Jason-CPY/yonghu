class AddCityIdToUserAddresses < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_addresses, :city
  end
end