class StringCalculator
  def add(numbers)
    return 0 if numbers.strip.empty?

    if numbers.start_with?("//")
      delimiter, numbers = numbers.split("\n", 2)
      delimiter = delimiter[2..-1] 
      numbers = numbers.split(delimiter)
    else
      numbers = numbers.split(/,|\n/) 
    end
    num_array = numbers.map(&:strip).map(&:to_i)
    negative_numbers = num_array.select { |n| n < 0 }
    raise "Negative numbers not allowed: #{negative_numbers.join(', ')}" unless negative_numbers.empty?
    num_array.sum
  end
end
