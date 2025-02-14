require_relative '../string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe "#add" do
    it "returns 0 for an empty string" do
      expect(calculator.add("")).to eq(0)
    end

    it "returns the number itself when only one number is given" do
      expect(calculator.add("1")).to eq(1)
    end

    it "returns the sum of two numbers" do
      expect(calculator.add("1,5")).to eq(6)
    end

    it "returns the sum of multiple numbers" do
      expect(calculator.add("1,2,3,4")).to eq(10)
    end

    it "handles numbers with spaces" do
      expect(calculator.add(" 1, 2,3 ")).to eq(6)
    end

    it "handles new lines" do
      expect(calculator.add("1\n2,3")).to eq(6)
    end

    it "handles custom delimiters" do
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it "handles different custom delimiters" do
      expect(calculator.add("//|\n2|3|5")).to eq(10)
    end


    it "raises an error when a negative number is given" do
      expect { calculator.add("1,-2,3") }.to raise_error("Negative numbers not allowed: -2")
    end

    it "raises an error and lists all negative numbers" do
      expect { calculator.add("1,-2,-3,4,-5") }.to raise_error("Negative numbers not allowed: -2, -3, -5")
    end
  end
end
