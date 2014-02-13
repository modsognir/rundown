module Rundown
  module Processors
    class ReadingTime < Rundown::Processor
      RATE = 0.312

      attr_accessor :reading_rate

      def initialize(words, reading_rate=RATE)
        super(words)
        @reading_rate = reading_rate
      end

      def process
        words.size * reading_rate
      end
    end
  end
end
