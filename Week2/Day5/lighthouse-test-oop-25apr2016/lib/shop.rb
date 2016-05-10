class Shop

  attr_reader :name, :inventory, :sales, :stock

  def initialize(name)
    raise ArgumentError.new('name required') if name.nil? || name=~/^\s*$/
    @name = name
    @inventory = []
    @sales = []
    @stock = {}
  end

  def add_to_inventory(item)
    raise ArgumentError.new('product required') if item.nil?
    @inventory << item
    if(@stock.include?(item.name))
      @stock[item] += 1
    else
      @stock[item] = 1
    end
  end

  def sell_item(product)
    if @inventory.include?(product)
    @inventory.delete(product)
    @sales << product
    return product
    end
    false #product not in inventory
  end

  def revenue

    @sales.inject(0) { |sum, item | sum + item.price }
  end

  def stock
    @stock
    #@inventory.each {|item| @stock[item.downcase] += 1}
  end

end
