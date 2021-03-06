class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :quantity
      t.float :price
      t.text :description
      t.string :image_url

      t.timestamps
    end
  end
end
