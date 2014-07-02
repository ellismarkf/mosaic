require 'yaml'

module Transliterator
  class ColorHash
    attr_reader :colors
    def initialize
      @colors = YAML.load_file('public/js/colors.yml')
    end
  end
end