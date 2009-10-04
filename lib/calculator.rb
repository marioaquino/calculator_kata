module Calculator
  def self.calculate(expression)
    raise ArgumentError, 'Must be a string expression' unless expression.is_a? String
    case expression
    when /\d\s*[\+\-\*\/]\s*\d/ 
      eval(expression).to_s
    else
    end
  end
end