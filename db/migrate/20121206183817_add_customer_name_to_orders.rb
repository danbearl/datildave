class AddCustomerNameToOrders < ActiveRecord::Migration
  def up
    change_table :orders do |t|
      t.string :customer_first_name
      t.string :customer_last_name
    end
  end

  def down
    change_table :orders do |t|
      t.remove :customer_first_name
      t.remove :customer_last_name
    end
  end
end
