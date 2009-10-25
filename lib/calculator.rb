module Calculator
  def self.calculate(expression)
    raise ArgumentError, 'Must be a string expression' unless expression.is_a? String
    raise ArgumentError, 'Must be numeric arithmetic' unless expression =~ pattern
    
    parts = []
    items = expression.scan(pattern) do |operand, operator|
      parts[0] = parts.empty? ? operand : parts[0].to_i.send(parts[1], operand.to_i)
      parts[1] = operator
    end
    parts[0].to_s
  end
  
  private
  def self.pattern
    /(\d+)\s?([\+\-\*\/]?)/
  end
end