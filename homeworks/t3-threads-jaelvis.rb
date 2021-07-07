def inputHandle(msg = "Input:", isInt = false)
  print "#{msg} "
  
  if (isInt == true)
    return gets.chomp.to_i
  end

  if (isInt == false)
    return gets.chomp.to_f
  end
end

def createThread(a, b)
  (0..3).each_with_index { |index| operation(@time_to_sleep[index][0], @time_to_sleep[index][1], @time_to_sleep[index][2], a, b)}
end

def operation(name, operation, sleepSeconds, a, b)
  semaphore = Mutex.new

  t1 = Thread.new do
    semaphore.synchronize {
      sleep(sleepSeconds)
      
      puts "#{name}: #{a.send(operation, b)}"
    }
  end.join

end

def main
  n = 0
  a = 0
  b = 0

  while !(n > 0)
    n = inputHandle("Deseja executar quantas vezes (N > 0)?", true)
  end

  a = inputHandle("Digite o valor de A:")
  while (b == 0)
    b = inputHandle("Digite o valor de B (B != 0):")
  end

  puts "\nExecuções:  #{n}x,\nValor de A: #{a},\nValor de B: #{b}"

  @time_to_sleep = [
                    ["SOMA", :+, rand(1..10)],
                    ["SUBTRACAO", :-, rand(1..10)],
                    ["MULTIPLICACAO", :*, rand(1..10)],
                    ["DIVISAO", :/, rand(1..10)],
                   ]

  (0..3).map { |index| puts "Tempo que a thread #{@time_to_sleep[index][0]} irá dormir: #{@time_to_sleep[index][2]} \n" }

  (1..n).map { |number| createThread(a, b) }
end

main()