require 'benchmark'

class LegitScript

  def function(a)

    a.inject({}) { |a, b| a[b] = a[b].to_i + 1; a }.\

    reject { |a, b| b == 1 }.keys

  end

  def count_duplicates(input_array)
    items_count = Hash.new(0)
    input_array.each do |item|
     items_count[item] += 1
    end
    items_count
  end

  def return_duplicated_values(input_array)
    duplicated_values =[]
    duplicate_count = count_duplicates(input_array)

    duplicate_count.each do |key, value|
      if value > 1
        duplicated_values.push(key)
      end
    end
    duplicated_values
  end

end

a = (0..100).collect{ rand(1000000000000000) }
b = (0..100).collect{ rand(1000000000000000) }
c = a + b

Benchmark.bmbm do |x|
  x.report("function") { LegitScript.new.function(c) }
  x.report("my method")  { LegitScript.new.return_duplicated_values(c)  }
end
