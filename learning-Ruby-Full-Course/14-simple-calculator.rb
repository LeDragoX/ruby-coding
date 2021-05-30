# ruby 14-simple-calculator.rb

def getOp()
    puts ("+  = Sum")
    puts ("-  = Subtract")
    puts ("*  = Multiply")
    puts ("/  = Divide")
    puts ("** = Exponential")
    print ("Enter one operation: ")
    op = gets().chomp()

    if (!op.is_a? String or op == "" or op.nil?)
        puts ("[E]: Invalid operation.")
        exit
    end

    return op
end

def calc(op = "+")
    print ("Enter a Number: ")
    num1 = gets().chomp().to_f
    print ("Enter another Number: ")
    num2 = gets().chomp.to_f

    result = nil

    if (op == "+")
        result = num1 + num2
        puts (num1.to_s + op + num2.to_s + " = " + result.to_s)
    elsif (op == "-")
        result = num1 - num2
        puts (num1.to_s + op + num2.to_s + " = " + result.to_s)
    elsif (op == "*")
        result = num1 * num2
        puts (num1.to_s + op + num2.to_s + " = " + result.to_s)
    elsif (op == "/")
        result = num1 / num2
        puts (num1.to_s + op + num2.to_s + " = " + result.to_s)
    elsif (op == "**")
        result = num1 ** num2
        puts (num1.to_s + op + num2.to_s + " = " + result.to_s)
    else
        puts ("[E]: Invalid operation.")
    end

    return result
end

op = getOp()
puts (op)

calc(op)