class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.decimal :price, precision: 10, scale: 2, default: 0
      t.string :method
      t.string :days

      t.timestamps
    end
  end
end
