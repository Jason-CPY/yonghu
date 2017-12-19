class CreateWaybills < ActiveRecord::Migration[5.1]
  def change
    create_table :waybills do |t|
      t.references :order

      t.string :status

      t.references :sender, polymorphic: true
      t.references :from_address

      t.references :receiver, polymorphic: true
      t.references :to_address

      t.datetime :exp_time
      t.datetime :actual_time

      t.timestamps
    end
  end
end
