class StringCalculator
  def add(numbers)
    return 0 if numbers.strip.empty?
    num_array = numbers.gsub("\n", ',').split(',').map(&:strip).map(&:to_i)
    num_array.sum
  end
end
