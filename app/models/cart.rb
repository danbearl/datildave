class Cart

  def self.subtotal(args)
    sub = 0
    args.each do |item|
      sub += item[:product_price].to_f * item[:product_quantity].to_f
    end
    return sub
  end

end
