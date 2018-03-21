class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.references :import_file, foreign_key: true
      t.string :buyer
      t.string :description
      t.decimal :unit_price
      t.decimal :amount
      t.string :address
      t.string :provider
    end
  end
end
