module Rundown
  module Processors
    class Frequency < Rundown::Processor
      attr_accessor :length

      def initialize(words, length=1)
        super(words)
        @length = length
      end

      def cleanup_words!
        @words = words.map {|w| w.gsub(/[^\w]/, '').downcase }.reject {|w| w.strip == ''  }
      end

      def process
        cleanup_words!
        frequencies = {}

        words.length.times do
          phrase = words[0..length-1]

          if phrase.join('').length >= 1
            frequencies[phrase] ||= 0
            frequencies[phrase] += 1
          end

          @words = words.rotate
        end

        totals = {}
        frequencies.each do |phrase, freq|
          totals[freq] ||= []
          totals[freq] << phrase
        end

        totals
      end
    end
  end
end