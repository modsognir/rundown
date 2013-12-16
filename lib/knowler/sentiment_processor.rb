module Knowler
  class SentimentProcessor < Processor
    attr_accessor :parser

    def initialize(words, parser=SentimentParser.new)
      @parser = parser
      super(words)
    end

    def process
      parser.parse(words.join(' '))
    end
  end
end