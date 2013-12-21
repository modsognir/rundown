module Rundown
  module Processors
    class Dates < Rundown::Processor
      attr_accessor :text, :parser

      def initialize(words, parser=Nickel)
        @text = words
        @parser = parser
      end

      def process
        parser.parse(text).occurrences
      end

    end
  end
end