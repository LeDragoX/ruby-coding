def inputHandle(msg = "Input:", isInt = false)
  print "#{msg + " "}"
  if (isInt == true)
    return gets.chomp.to_i
  end
  if (isInt == false)
    return gets.chomp.to_f
  end
end

def createThread(n, a, b, operation, name)
  semaphore = Mutex.new

  puts "#{semaphore.inspect} - #{operation} - #{name}"
  Thread.new do
    counter      = 1
    sleepLimit   = 10
    sleepSeconds = rand(1..sleepLimit)

    semaphore.synchronize {
      puts "Tempo que a thread[#{self.object_id}] #{name} irá dormir: #{sleepSeconds}"
      while (counter <= n)

        sleep(sleepSeconds)
        puts "[#{counter}x] #{name}: #{a.send(operation, b)}"
        counter += 1

      end
    }
  end

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

  ops = {
    :+ => "SOMA",
    :- => "SUBTRACAO",
    :* => "MULTIPLICACAO",
    :/ => "DIVISAO"
  }

  ops.map { |op, name| createThread(n, a, b, op, name) }
  .each(&:join)

end

main()