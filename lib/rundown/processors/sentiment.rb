module Rundown
  module Processors
    class Sentiment < Rundown::Processor
      attr_accessor :parser

      def initialize(words, parser=SentimentParser)
        @parser = parser
        super(words)
      end

      def process
        parser.parse(words.join(' '))
      end
    end
  end
end