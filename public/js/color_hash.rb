require 'yaml'

module Transliterator
  class ColorHash
    attr_reader :random, :colors, :midnight, :spring
    def initialize
      @random = YAML.load_file('public/js/random.yml')
      @colors = YAML.load_file('public/js/colors.yml')
      @midnight = YAML.load_file('public/js/midnight.yml')
      @spring = YAML.load_file('public/js/spring.yml')
    end
  end
end