class GAME
    ROCK = ["rock", "r"]
    PAPER = ["paper", "p"]
    SCISSORS = ["scissors","s"]
    
    attr_accessor :player, :wins, :losses, :randomness

    def initialize
        @wins = 0
        @losses = 0
        @player = ""
        @randomness = 5
    end

    def start
        setup_game
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
        else
            puts "Invalid input, please enter a number from 0-100"
            r = gets
        end
    end

    def game_loop
        loop do

        end
    end

    def goodbye
        puts "Good Game"
    end

end
