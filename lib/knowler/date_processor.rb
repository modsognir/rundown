module Knowler
  class DateProcessor < Processor
    attr_accessor :text, :parser

    def initialize(words, parser=Nickel)
      @text = words.join(' ')
      @parser = parser
    end

    def process
      parser.parse(text).occurrences
    end

  end
end