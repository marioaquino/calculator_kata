module Calculator
  def self.calculate(expression)
    raise ArgumentError, 'Must be a string expression' unless expression.is_a? String
    raise ArgumentError, 'Must be numeric arithmetic' unless expression =~ /\d\s[\+\-\*\/]\s\d/
    
    parts = []
    expression.split(/\s/).each do |val|
      parts << val
      if parts.size == 3
        result = parts[0].to_i.send(parts[1].to_sym, parts[2].to_i)
        parts.replace([result])
      end
    end

    parts[0].to_s
  end
end