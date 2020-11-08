class Cart
  attr_accessor :products_in_cart

  def initialize
    @products_in_cart = []
  end

  def add_product(product)
    @products_in_cart << product
    product.amount -= 1
  end

  def sum
    @products_in_cart.sum(&:price)
  end

  def to_s
    products_in_cart.
      tally.
      map { |product, amount| "#{product.without_amount} x #{amount} шт. = #{amount * product.price} руб." }.
      join("\n")
  end
end
