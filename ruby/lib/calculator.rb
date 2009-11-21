module Calculator
  def self.calculate(expression)
    raise ArgumentError, 'Must be a string expression' unless expression.is_a? String
    raise ArgumentError, 'Must be numeric arithmetic' unless expression =~ pattern
    
    sets = lambda { expression.scan(pattern) }
    
    sets.call.drop(1).
      reduce(evaluate(*sets.call.first)) do |last_result, equation| 
        evaluate(last_result, *equation[1..2]) 
      end
  end
  
  private
  def self.evaluate(left, operator, right)
    eval(left + operator + right).to_s
  end
  
  def self.pattern
    /(\d+)\s?([\+\-\*\/])\s*(?=(\d+))/
  end
end