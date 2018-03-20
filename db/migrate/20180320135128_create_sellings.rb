class CreateSellings < ActiveRecord::Migration[5.1]
  def change
    create_table :sellings do |t|
      t.string :buyer
      t.string :description
      t.decimal :unit_price
      t.decimal :amount
      t.string :address
      t.string :provider
    end
  end
end
