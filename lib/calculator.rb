module Calculator
  def self.calculate(expression)
    raise ArgumentError, 'Must be a string expression' unless expression.is_a? String
    
    operands = []
    expression.split(/\s/).each do |val|
      operands << val
      if operands.size == 3
        result = operands[0].to_i.send(operands[1].to_sym, operands[2].to_i)
        operands.replace([result])
      end
    end

    operands[0].to_s
  end
end