class Customer

  attr_reader :budget, :cart

  def initialize(budget=500)
    @budget = budget
    @cart = []
    @price_in_cart = 0
  end

  def add_to_cart(product)
    if @cart.size < 5 && @price_in_cart + product.price <= @budget
      @cart << product
      @price_in_cart += product.price
      true
    else
      false
    end
  end

  def checkout(shop)
    @budget = @budget - @price_in_cart
    @cart.each do |item|
      shop.inventory.delete(item)
      shop.sales.push(item)
    end
    @cart.clear
    @budget
  end

end
