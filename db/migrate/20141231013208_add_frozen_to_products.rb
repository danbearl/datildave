class AddFrozenToProducts < ActiveRecord::Migration
  def change
    add_column :products, :frozen, :boolean
  end
end
