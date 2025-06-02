class GAME
    ROCK = ["rock", "r"]
    PAPER = ["paper", "p"]
    SCISSORS = ["scissors","s"]
    VALID_COMMANDS = ["rock", "r","paper", "p","scissors","s","quit"]
    
    attr_accessor :player, :wins, :losses, :randomness

    def initialize
        @wins = 0
        @losses = 0
        @player = ""
        @randomness = 5
    end

    def start
        setup_game
        instructions
        game_loop
        goodbye
    end

    def setup_game
        puts "What is your name?"
        @player = gets
        puts "Hello, #{@player}, how random do you want the bot to be?"
        puts "Enter a number from 0-100. It defaults to 5%"
        set_randomness
    end

    def set_randomness
        r = gets
        loop do
        if r =~ /[0-100]/
            @randomness = r.to_i
            return
        elsif r.to_i < 0
            @randomness = -1
            puts ";)"
            return
        else
            puts "Invalid input, please enter a number from 0-100"
            r = gets
        end
    end

    def instructions
        puts "In \"Rock, Paper, Scissors\" rock beats scissors, paper beats rock, and scissors beats paper"
        puts "You will input either \"rock\", \"paper\", or \"scissors\" or the first letter of each of them to \'throw your play\""
        puts "The computer will then respond based on the current gameplay and it's randomness that you put in earlier"
        puts "At any time, you can type \"quit\" to exit"
    end

    def game_loop
        loop do
            puts "Throw a hand"

        end
    end

    def goodbye
        puts "Good Game. You won #{@wins} times and lost #{@losses} times"
    end

end
