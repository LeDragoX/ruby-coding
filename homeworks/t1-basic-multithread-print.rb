# Maybe this is not "Multithreaded", but it's using Threads at least

class MultiMan
    attr_accessor :message

    def initialize(message)
        @message = message

        ThreadedPrinting()
    end

    def ThreadedPrinting()
        for str in @message do
            thread = Thread.new do
                puts "Thread [#{thread.object_id}]: #{str}"
                #sleep 0.5
            end
            thread.join
        end
    end
end

lst = ['Programação Paralela', 'Instituto Federal Fluminense']
multi1 = MultiMan.new(lst)
