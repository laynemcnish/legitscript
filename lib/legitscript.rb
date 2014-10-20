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

  def benchmark_function
    output = File.open( "/Users/laynemcnish/gSchoolWork/Scratch/legitscript/bin/function_benchmarks.txt","w" )
    (1000..100000).step(1000).each do |i|
      a = (0..i).collect { rand(10000) }
      b = (0..i).collect { rand(10000) }
      c = a + b
      func_time = Benchmark.realtime do
        LegitScript.new.function(c)
      end
      output << "#{c.length}\t#{func_time}\n"
    end
    output.close
  end

  def benchmark_duplicated_methods
    output = File.open( "/Users/laynemcnish/gSchoolWork/Scratch/legitscript/bin/duplicate_benchmarks.txt","w" )
    (1000..100000).step(1000).each do |i|
      a = (0..i).collect { rand(10000) }
      b = (0..i).collect { rand(10000) }
      c = a + b
      func_time = Benchmark.realtime do
        LegitScript.new.return_duplicated_values(c)
      end
      output << "#{c.length}\t#{func_time}\n"
    end
    output.close
  end
end

LegitScript.new.benchmark_function
LegitScript.new.benchmark_duplicated_methods




