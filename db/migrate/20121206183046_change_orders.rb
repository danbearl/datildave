class ChangeOrders < ActiveRecord::Migration
  def up
    change_table :orders do |t|
      t.remove :customer_name
      t.remove :mailing_address

      t.string :address_street_1
      t.string :address_street_2
      t.string :address_city
      t.string :address_state
      t.string :address_zip
      t.boolean :processed
    end
  end

  def down
    change_table :orders do |t|
      t.string :customer_name
      t.text :mailing_address

      t.remove :address_street_1
      t.remove :address_street_2
      t.remove :address_city
      t.remove :address_state
      t.remove :address_zip
      t.remove :processed
    end
  end
end
