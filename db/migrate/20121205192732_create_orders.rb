class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.text :products
      t.text :mailing_address
      t.string :customer_name
      t.string :customer_email
      t.string :subtotal
      t.string :shipping
      t.boolean :shipped
      t.text :notes

      t.timestamps
    end
  end
end
