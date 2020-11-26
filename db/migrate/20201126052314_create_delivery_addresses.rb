class CreateDeliveryAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_addresses do |t|
      t.string     :postal_code,      null: false
      t.integer    :shipping_area_id, null: false
      t.string     :city,             null: false
      t.string     :home_number,      null: false
      t.string     :apartment_name,   null: false
      t.string     :phpne_number,     null: false
      t.references :purchase,         foreign_key: true

      t.timestamps
    end
  end
end
