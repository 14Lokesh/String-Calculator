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
    numbers.map(&:strip).map(&:to_i).sum
  end
end
