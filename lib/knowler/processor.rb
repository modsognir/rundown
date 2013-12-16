module Knowler
  class Processor
    attr_accessor :words

    def initialize(words)
      @words = Array(words)
    end
  end
end