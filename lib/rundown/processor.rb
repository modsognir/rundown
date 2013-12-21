module Rundown
  class Processor
    attr_accessor :words

    def initialize(words)
      @words = words.to_s.split(/\s/)
    end
  end
end