class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.string :code
      t.references :order, foreign_key: true
      t.decimal :discount, precision: 10, scale: 2
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
