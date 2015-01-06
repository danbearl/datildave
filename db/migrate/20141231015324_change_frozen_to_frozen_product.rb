class ChangeFrozenToFrozenProduct < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.remove :frozen
      t.boolean :frozen_product
    end
  end
end
