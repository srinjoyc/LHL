class Laptop < Product

  attr_reader :specs, :ram, :processor, :size # ram, processor, & size will be initialized from spec hash

  def initialize (name, price, brand, specs)
    super(name,price,brand)
    @specs = specs
    specs.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end


end
