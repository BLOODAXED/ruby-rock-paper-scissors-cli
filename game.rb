class Game
    ROCK = ["rock", "r"]
    PAPER = ["paper", "p"]
    SCISSORS = ["scissors","s"]
    VALID = ["rock", "r","paper", "p","scissors","s","quit"]
    
    attr_accessor :player, :wins, :losses, :randomness, :prev_throw, :prev_result #prev_throw and prev_result are from the cpu's POV

    def initialize
        @wins = 0
        @losses = 0
        @player = ""
        @randomness = 5
        @prev_throw = ""
        @prev_result = 0 #0 is draw, 1 is non-draw
    end

    def start
        setup_game()
        instructions()
        game_loop()
        goodbye()
    end

    def setup_game
        puts "What is your name?"
        @player = gets.chomp
        puts ""
        puts "Hello, #{@player}, how random do you want the bot to be?"
        puts "Enter a number from 0-100. It defaults to 5%"
        set_randomness
    end

    def set_randomness
        r = gets.chomp
        puts ""
        loop do
            if r =~ /\d\d?\d?|\-1/ 
                if r.to_i > 0 && r.to_i <= 100
                    @randomness = r.to_i
                    return
                elsif r =~ /[0-100]/ && r.to_i < 0
                    @randomness = -1
                    puts ";)" #easter egg for cheat mode
                    return
                end
            else
                puts "Invalid input, please enter a number from 0-100"
                r = gets.chomp
                puts ""
            end
        end
    end

    def instructions
        puts "In \"Rock, Paper, Scissors\" rock beats scissors, paper beats rock, and scissors beats paper"
        puts "You will input either \"rock\", \"paper\", or \"scissors\" or the first letter of each of them to \'throw your play\""
        puts "The computer will then respond based on the current gameplay and it's randomness that you put in earlier"
        puts "At any time, you can type \"quit\" to exit\n"
    end

    def game_loop
        loop do
            puts "#{@player}, Throw a hand"
            play = gets.chomp
            puts ""
            if VALID.include?(play.downcase)
                if play == "quit"
                    return
                end
                result = get_cpu_play(play.downcase)
                case result
                when 0
                    win()
                when 1
                    lose()
                when 3
                    drawed()
                end
            else
                puts "Bad input. Please try again"
            end
        end
    end

    def get_cpu_play(p_throw)
        if @randomness == -1
            cpu_cheat(p_throw)
        else
            if prev_result == 0
                draw_play(p_throw)
            elsif prev_result == 1
                non_draw(p_throw)
            end
        end
    end

    #computer will play a random throw
    def draw_play(p)
        c = rand(3)
        case c
        when 0
            score(p,"r")
        when 1
            score(p,"p")
        when 2
            score(p,"s")
        end
    end

    #If you won the last round: play next what your opponent just played.
    #If you lost the last round: play the thing that didn’t come up
    #these end up being the same play either way, so we only need one function for both wins and losses
    def non_draw(p)
        if @randomness <= rand(100)
            draw_play(p)
        else
            if @prev_throw == "r"
                score(p,"s")
            elsif @prev_throw == "p"
                score(p,"r")
            else
                score(p,"p")
            end
        end
    end

    def cpu_cheat(p_throw)
        if ROCK.include?(p_throw)
            score(p_throw,"p")
        elsif PAPER.include?(p_throw)
            score(p_throw,"s")
        else
            score(p_throw,"r")
        end
    end

    def score(p_throw,c_throw)
        @prev_throw = c_throw
        p_throw = p_throw[0] #i'm lazy and just want to look at single letter inputs
        if p_throw == c_throw
            return 3
        elsif p_throw == "r"
            if c_throw == "s"
                return 0
            else
                return 1
            end
        elsif p_throw == "p"
            if c_throw == "r"
                return 0
            else
                return 1
            end
        elsif p_throw == "s"
            if c_throw == "p"
                return 0
            else
                return 1
            end
        else #in case we get here without p_throw being valid
            puts "bad input"
        end
    end
    
    def win
        @prev_result = 1
        @wins = @wins+1
        puts "YOU WIN!"
        puts "Wins: #{@wins}"
        puts "Losses: #{@losses}\n"
    end

    def lose
        @prev_result = 1
        @losses = @losses+1
        puts "You lose"
        puts "Wins: #{@wins}"
        puts "Losses: #{@losses}\n"
    end

    def drawed
        puts "DRAW! No Score Change!\n"
            @prev_result = 0
    end

    def goodbye
        puts "Good Game, #{@player}. You won #{@wins} times and lost #{@losses} times"
    end

end
