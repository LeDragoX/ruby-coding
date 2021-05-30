# ruby 17-guessing-game.rb

guess_word     = "giraffe"
guess          = ""
guess_count    = 0
guess_limit    = 10
out_of_guesses = false

while (guess != guess_word and !out_of_guesses)
    if (guess_count < guess_limit) 
        print ("[ " + (guess_count+1).to_s + "/" + guess_limit.to_s + " ] Enter Guess: ")
        guess = gets().chomp()
        guess_count += 1
    else
        out_of_guesses = true
    end
end

if (out_of_guesses == true)
    puts ("YOU LOST!")
else  
    puts("YOU WON!")
end