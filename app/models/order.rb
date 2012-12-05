class Order < ActiveRecord::Base
  attr_accessible :customer_email, :customer_name, :mailing_address, :notes, :products, :shipped, :shipping, :subtotal
end
