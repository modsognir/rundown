module Rundown
  module Processors
    class Phone < Rundown::Processor
      attr_accessor :formatter, :text

      def initialize(words, formatter=Phony)
        @text = words
        @formatter = formatter
      end

      def format(number)
        number.start_with?('0') ? number : formatter.formatted(number)
      end

      def process
        remove_punctuation(text).scan(/\d{7,13}/).map {|number| format(number) }
      end
    end
  end
end