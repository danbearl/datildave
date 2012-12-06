class Order < ActiveRecord::Base
  attr_accessible :customer_email, :customer_name, :mailing_address, :notes, :products, :shipped, :shipping, :subtotal

  def self.package_products(products)
    tmp = []
    products.each do |item|
      tmp << hash_to_string(item)
    end

    tmp.join("|")
  end

  def self.unpack_products(products)
    tmp = []
    products.split("|").each do |item|
      tmp << string_to_hash(item)
    end

    tmp
  end

  private
  
  def self.hash_to_string(hsh)
    tst = []
    hsh.each do |key, value| 
      tst << "#{value}@#{key}"
    end

    tst.join(",")
  end

  def self.string_to_hash(str)
    hsh = str.split(",").inject(Hash.new{|h,k| h[k]=""}) do |h,s|
      v, k = s.split(/@/)
      k = k.to_sym
      h[k] = v
      h
    end
  end

end
