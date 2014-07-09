require 'yaml'

module Transliterator
  class ColorHash
<<<<<<< HEAD
    attr_reader :random, :colors, :midnight, :spring
=======
    attr_reader :colors, :midnight, :spring
>>>>>>> 658da7b890cd1e85d5bd6f108b4e3fe896d048d3
    def initialize
      @random = YAML.load_file('public/js/random.yml')
      @colors = YAML.load_file('public/js/colors.yml')
      @midnight = YAML.load_file('public/js/midnight.yml')
      @spring = YAML.load_file('public/js/spring.yml')
    end
  end
end