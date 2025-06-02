require "minitest/autorun"
require "./game.rb"

class TestRPS < Minitest::Test
    
    def setup
        @rps = Game.new
    end

    def test_score_win
        assert_equal 0, @rps.score("p","r"), "Score method failed on win"
    end
       
    def test_score_lose
        assert_equal 1, @rps.score("r","p"), "Score method failed on lose"
    end

    def test_score_draw
        assert_equal 3, @rps.score("r","r"), "Score method failed on draw"
    end
end