# Allow the add method to handle new lines between numbers (instead of commas).

# The following input is valid: "1\n2,3" (will return 6)
# The following input is invalid: "1,\n"
# Support different delimiters

# To change delimiter, the beginning of the string will contain a separate line that looks like this: "//[delimiter]\n[numbers…]", for example "//;\n1;2" here the delimiter is ";" and this should return 3.
# Calling add with a negative number will throw an exception "negative numbers not allowed <negative_number>".

# If there are multiple negative numbers, show all of them in the exception message, separated by commas

class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = ","
    if numbers.start_with?("//")
      custom_delimiter_match = /^\/\/(.+)\n/.match(numbers)
      delimiter = custom_delimiter_match[1] if custom_delimiter_match
      numbers = numbers.sub(/^\/\/.+\n/, "")
    end

    numbers = numbers.gsub(/\n/, delimiter)
    numbers_array = numbers.split(delimiter).map(&:to_i)

    numbers_array.sum
  end
end
