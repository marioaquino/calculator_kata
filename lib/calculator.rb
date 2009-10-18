module Calculator
  def self.calculate(expression)
    raise ArgumentError, 'Must be a string expression' unless expression.is_a? String
    
    operands = []
    def operands.combine(value)
      replace([value.to_s])
    end
    expression.split(/\s/).each do |val|
      operands << val
      if operands.size == 3
        [0, 2].each {|i| operands[i] = operands[i].to_i}
        case operands[1]
        when "+"
          operands.combine(operands[0] + operands[2])
        when "-"
          operands.combine(operands[0] - operands[2])
        when "/"
          operands.combine(operands[0] / operands[2])
        when "*"
          operands.combine(operands[0] * operands[2])
        end
      end
    end

    operands[0]
  end
end