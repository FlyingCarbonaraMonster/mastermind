# frozen_string_literal: true

require_relative 'board'
require_relative 'colors'
require_relative 'feedback'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  MAX_TURNS = 12

  def initialize
    @board = Board.new
    @human_player = HumanPlayer.new
    @computer_player = ComputerPlayer.new
    @codemaker = @codebreaker = @secret = @winner = nil
  end

  # Method that starts the game
  def play
    puts 'Welcome to Mastermind!'
    choose_roles
    @secret = @codemaker.create_secret
    play_rounds
    announce_result
  end

  private

  # Ask the user the desired role
  def choose_roles
    loop do
      puts 'Do you want to be a Codebreaker(1) or a Codemaker(2)?'
      case gets.chomp.strip
      when '1' then return assign_roles(@human_player, @computer_player)
      when '2' then return assign_roles(@computer_player, @human_player)
      end
      puts 'Invalid input, try again.'
    end
  end

  def assign_roles(breaker, maker)
    @codebreaker = breaker
    @codemaker = maker
  end

  # The core of the game, loop until the end of the game
  def play_rounds
    1.upto(MAX_TURNS) do |turn|
      puts "Turn ##{turn}"
      guess = @codebreaker.make_guess
      feedback = Feedback.evaluate(@secret, guess)
      @codebreaker.receive_feedback(guess, feedback)
      @board.add_turn(guess, feedback)
      @board.display
      return @winner = @codebreaker if won?(feedback)
    end
  end

  def announce_result
    if @winner
      puts "#{@winner.name} WON!"
    else
      puts "Out of turns! The secret code was #{Colors.format_code(@secret)}"
    end
  end

  def won?(feedback)
    feedback == %i[exact exact exact exact]
  end
end
