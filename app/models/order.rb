class Order < ActiveRecord::Base
  attr_accessible :customer_email, :customer_first_name, :customer_last_name, :address_street_1, :address_street_2, :address_city, :address_state, :address_zip, :processed, :notes, :products, :shipped, :shipping, :subtotal, :stripe_card_token

  attr_accessor :stripe_card_token

  def save_with_payment
    if valid?
      total = (100 * (shipping.to_f + subtotal.to_f)).to_i
      payment_response = Stripe::Charge.create(
        amount: total,
        currency: "usd",
        card: stripe_card_token,
        description: "Charge for #{customer_email}"
      )

      self.stripe_payment_token = payment_response.id
      save!
    end

  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while processing payment: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
  end

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
