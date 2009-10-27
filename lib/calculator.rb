module Calculator
  def self.calculate(expression)
    raise ArgumentError, 'Must be a string expression' unless expression.is_a? String
    raise ArgumentError, 'Must be numeric arithmetic' unless expression =~ pattern
    
    value = nil
    expression.scan(pattern) do |left, operator, right|
      value ||= left
      value = eval(value + operator + right).to_s
    end
    value
  end
  
  private
  def self.pattern
    /(\d+)\s?([\+\-\*\/])\s*(?=(\d+))/
  end
end