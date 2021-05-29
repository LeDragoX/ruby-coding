['Programação Paralela', 'Instituto Federal Fluminense']
  .map { |message| Thread.new { puts message } }
  .each(&:join)
