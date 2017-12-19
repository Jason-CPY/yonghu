class CreateCitiesUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :cities_users do |t|
      t.references :city
      t.references :user

      t.timestamps
    end
  end
end
