['Programação Paralela', 'Instituto Federal Fluminense']
  .map { |message| Thread.new { puts "Thread [#{self.object_id}]: #{message}" } }
  .each(&:join)
