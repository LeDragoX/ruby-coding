def calcGustafson(p_number, alpha)
  puts "Gustafson's Law"
  puts "==========================================================="
  puts "N_Processors | 05.00% | 10.00% | 50.00% | 70.00% | 90.00% |"
  puts "==========================================================="

  # Run from the Project's root directory
  File.open("homeworks/data/gustafson.csv", "w+") do |file|
    file.write("N_Processors, 05.00%, 10.00%, 50.00%, 70.00%, 90.00%\n")
    p_number.map do |n|
      formula = lambda { |n, curAlpha| (n + (curAlpha * ( 1 - n ) )).round(2) }

      speedup5 = formula.call(n, alpha[0])
      speedup10 = formula.call(n, alpha[1])
      speedup50 = formula.call(n, alpha[2])
      speedup70 = formula.call(n, alpha[3])
      speedup90 = formula.call(n, alpha[4])

      print "     #{n}       |" if (n < 10)
      print "     #{n}      |" if (n >= 10 && n < 100)
      print "     #{n}     |" if (n >= 100)

      print " #{speedup5}%  |" if (speedup5 < 10)
      print " #{speedup5}% |" if (speedup5 >= 10 && speedup5 < 100)

      print " #{speedup10}%   |" if (speedup10 < 10)
      print " #{speedup10}%  |" if (speedup10 >= 10 && speedup10 < 100)

      print " #{speedup50}%   |" if (speedup50 < 10)
      print " #{speedup50}%  |" if (speedup50 >= 10 && speedup50 < 100)

      print " #{speedup70}%   |" if (speedup70 < 10)
      print " #{speedup70}%  |" if (speedup70 >= 10 && speedup70 < 100)

      print " #{speedup90}%   |" if (speedup90 < 10)
      print " #{speedup90}%  |" if (speedup90 >= 10 && speedup90 < 100)

      puts
      file.write("#{n}, #{speedup5}%, #{speedup10}%, #{speedup50}%, #{speedup70}%, #{speedup90}%\n")
    end
    puts "==========================================================="
  end
end

def calcAmdahl(p_number, s)
  puts "Amdahl's Law"
  puts "==========================================================="
  puts "N_Processors | 05.00% | 10.00% | 50.00% | 70.00% | 90.00% |"
  puts "==========================================================="

  # Run from the Project's root directory
  File.open("homeworks/data/amdahl.csv", "w+") do |file|
    file.write("N_Processors, 05.00%, 10.00%, 50.00%, 70.00%, 90.00%\n")
    p_number.map do |n|
      formula = lambda { |n, s| (1 / ( s + ((1 - s) / n ))).round(2) }

      speedup5 = formula.call(n, s[0])
      speedup10 = formula.call(n, s[1])
      speedup50 = formula.call(n, s[2])
      speedup70 = formula.call(n, s[3])
      speedup90 = formula.call(n, s[4])

      print "     #{n}       |" if (n < 10)
      print "     #{n}      |" if (n >= 10 && n < 100)
      print "     #{n}     |" if (n >= 100)

      print " #{speedup5}%  |" if (speedup5 < 10)
      print " #{speedup5}% |" if (speedup5 >= 10 && speedup5 <= 100)

      print " #{speedup10}%  |" if (speedup10 < 10)
      print " #{speedup10}%  |" if (speedup10 >= 10 && speedup10 <= 100)

      print " #{speedup50}%  |" if (speedup50 < 10)
      print " #{speedup50}%  |" if (speedup50 >= 10 && speedup50 <= 100)

      print " #{speedup70}%  |" if (speedup70 < 10)
      print " #{speedup70}%  |" if (speedup70 >= 10 && speedup70 <= 100)

      print " #{speedup90}%   |" if (speedup90 < 10)
      print " #{speedup90}%  |" if (speedup90 >= 10 && speedup90 <= 100)

      puts
      file.write("#{n}, #{speedup5}%, #{speedup10}%, #{speedup50}%, #{speedup70}%, #{speedup90}%\n")
    end
    puts "==========================================================="
  end
end

def main()
  # Processors number
  processor_number   = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 30, 40, 50, 80, 100]
  # In % sequential portion
  sequential_portion = [0.05, 0.1, 0.5, 0.7, 0.9]

  calcGustafson(processor_number, sequential_portion)
  calcAmdahl(processor_number, sequential_portion)
end

main()