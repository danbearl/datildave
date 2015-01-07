class SetDefaultQuantityOnProducts < ActiveRecord::Migration
  def change
    change_column_default :products, :quantity, 0
  end
end
