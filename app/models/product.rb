class Product < ActiveRecord::Base
  attr_accessible :description, :image, :name, :price, :quantity

  mount_uploader :image, ImageUploader
end
