require 'pry-byebug'

module Transliterator
  class Randomizer

    def self.hex_gen
      vals = 3.times.map { |n| rand(255)}
      return "#%02X%02X%02X" % vals
    end

    def self.run


      stored = Transliterator::ColorHash.new

      random = stored.random

      # binding.pry

      random.each do |letter, color_val|
        if random[letter] == nil
          random[letter] = Transliterator::Randomizer.hex_gen
        end
      end

      return random

    end
  end
end