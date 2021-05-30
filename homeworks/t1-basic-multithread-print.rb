# WIP

class MultiMan
    attr_accessor :message

    def initialize(message)
        @message = message
    end

    def ThreadedPrinting()
        puts (@message)
    end
end


lst = ['Programação Paralela', 'Instituto Federal Fluminense']
multi1 = MultiMan.new(lst)
multi1.ThreadedPrinting()