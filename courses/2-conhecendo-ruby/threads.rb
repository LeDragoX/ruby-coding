def thr1()
    thread = Thread.new do
        puts "Thread #{self.object_id} iniciada!"
        3.times do |valor|
            puts "#{valor+1}"
            sleep 0.1
        end
    end
    
    puts "Já criei a thread"
    thread.join
end

def thr2()
    thread = Thread.new do
        puts "Thread #{self.object_id} iniciada!"
        5.times do |valor|
            puts valor
            sleep 1
        end
    end
    
    puts "já criei a thread"
    thread.join(1)  # Timeout
end

def thr3()
    proc = Proc.new do |parametro|
        parametro.times do |valor|
            print "[#{valor + 1}/#{parametro}]"
            sleep 0.5
        end
    end
    
    thread = nil
    5.times do |valor|
        thread = Thread.new(valor, &proc)
    end
    
    thread.join
    puts "Terminado!"
end

#thr1()
#thr2()
thr3()