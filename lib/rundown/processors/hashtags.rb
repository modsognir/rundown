module Rundown
  module Processors
    class Hashtags < Rundown::Processor
      def process
        words.select { |word| word.start_with?('#') && word.size > 1 }
      end
    end
  end
end