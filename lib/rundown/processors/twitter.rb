module Rundown
  module Processors
    class Twitter < Rundown::Processor
      def process
        words.select { |word| word.start_with?('@') }
      end
    end
  end
end