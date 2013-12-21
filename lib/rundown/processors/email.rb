module Rundown
  module Processors
    class Email < Rundown::Processor
      REGEX = /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

      def cleanup_words
        words = @words.map { |word|
          word.gsub!(/\(|\)/, "")
        }
      end

      def process
        cleanup_words
        words.select { |word|
          Array(word.match(REGEX))[0]
        }.reject(&:empty?).map {|word|
          word.split('@')
        }.reject { |words|
          words.size < 2 
        }.select { |words|
          x = Array(words.last).last.to_s.split('.').last
          x.length <= 4 && !x.match(/\d+/)
        }.map { |words|
          words.join("@")
        }
      end
    end
  end
end