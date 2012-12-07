class AddStripeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :stripe_payment_token, :string
  end
end
