class AddImageToCategories < ActiveRecord::Migration
  def change
    change_table :categories do |t|
      t.string :image
    end
  end
end
