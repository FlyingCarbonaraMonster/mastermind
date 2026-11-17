# frozen_string_literal: true

module Feedback
  # Return array with results of comparison between secret code and guess from the player
  def self.evaluate(secret, guess)
    secret_copy = secret.dup
    guess_copy = guess.dup
    exact = find_exact_matches(secret_copy, guess_copy)
    partial = find_partial_matches(secret_copy, guess_copy)
    exact + partial
  end

  # Find exact matches, the ones with right color and right position
  def self.find_exact_matches(secret_copy, guess_copy)
    secret_copy.each_with_index.with_object([]) do |(elem, index), matches|
      if elem == guess_copy[index]
        matches.push(:exact)
        secret_copy[index] = guess_copy[index] = nil
      end
    end
  end

  # Find partial matches, the ones with only the right color
  def self.find_partial_matches(secret_copy, guess_copy)
    guess_copy.each_with_object([]) do |elem, matches|
      next if elem.nil?

      secret_index = secret_copy.index(elem)
      next if secret_index.nil?

      matches.push(:partial)
      secret_copy[secret_index] = nil
    end
  end

  private_class_method :find_exact_matches, :find_partial_matches
end
