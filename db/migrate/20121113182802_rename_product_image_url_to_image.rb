class RenameProductImageUrlToImage < ActiveRecord::Migration
 
  def up
    change_table :products do |t|
      t.remove :image_url
      t.string :image
    end
  end

  def down
    change_table :products do |t|
      t.remove :image
      t.string :image_url
    end
  end
  
end
