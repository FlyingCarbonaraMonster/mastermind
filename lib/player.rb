# frozen_string_literal: true

class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  # #create_secret and #make_guess act as abstract method
  def create_secret
    raise NotImplementedError, "#{self.class} must implement #create_secret"
  end

  def make_guess
    raise NotImplementedError, "#{self.class} must implement #make_guess"
  end

  # Needed by ComputerPlayer to track feedback
  def receive_feedback(_guess, _feedback); end
end
