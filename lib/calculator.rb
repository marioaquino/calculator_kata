module Calculator
  def self.calculate(expression)
    raise ArgumentError, 'Must be a string expression' unless expression.is_a? String
    raise ArgumentError, 'Must be numeric arithmetic' unless expression =~ pattern
    
    sets = expression.scan(pattern)
    sets.reduce(eval(*sets.shift)) {|memo, obj| eval(memo, *obj[1..2]) }
  end
  
  private
  def self.eval(left, operator, right)
    Kernel::eval(left + operator + right).to_s
  end
  
  def self.pattern
    /(\d+)\s?([\+\-\*\/])\s*(?=(\d+))/
  end
end