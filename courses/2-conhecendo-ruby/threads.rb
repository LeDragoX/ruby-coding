def thr1()
    thread = Thread.new do
        puts "|thr1| Thread #{self.object_id} iniciada!"
        3.times do |valor|
            puts "|thr1| #{valor+1}"
            sleep 0.1
        end
    end
    
    puts "|thr1| Já criei a thread"
    thread.join
end

def thr2()
    thread = Thread.new do
        puts "|thr2| Thread #{self.object_id} iniciada!"
        5.times do |valor|
            puts "|thr2| #{valor}"
            sleep 1
        end
    end
    
    puts "|thr2| já criei a thread"
    thread.join(1)  # Timeout
end

def thr3()
    proc = Proc.new do |parametro|
        parametro.times do |valor|
            print "|thr3| [#{valor + 1}/#{parametro}]\n"
            sleep 0.5
        end
    end
    
    thread = nil
    5.times do |valor|
        thread = Thread.new(valor, &proc)
    end
    
    thread.join
    puts "|thr3| Terminado!"
end

thr1()
thr2()
thr3()