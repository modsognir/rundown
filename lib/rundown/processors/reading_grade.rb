module Rundown
  module Processors
    class ReadingGrade < Rundown::Processor
      def percent_difficult_words
        (difficult_words.length.to_f / words.length.to_f) * 100
      end

      def difficult_words
        @difficult_words ||= (words_without_nouns.uniq.map(&:downcase) - known_words.map(&:downcase)).reject {|w| w.length < 5 }
      end

      def known_words
        self.class.known_words
      end

      def self.known_words
        @known_words ||= File.readlines(File.expand_path('../../../../data/known_words.txt', __FILE__)).map(&:chomp)
      end

      def words
        text.split(/[^a-zA-Z']+/)
      end

      def words_without_nouns
        words.reject { |w| w[0].upcase == w[0] }
      end

      def words_for(sentence)
        sentence.split(/[^a-zA-Z']+/)
      end

      def average_sentence_length
        sen = sentences.map {|s| words_for(s).length }
        sen.reduce(:+).to_f / sen.size
      end

      # http://en.wikipedia.org/wiki/Dale%E2%80%93Chall_readability_formula
      def score
        raw_score = (0.1579 * (percent_difficult_words)) + (0.0496 * average_sentence_length)
        percent_difficult_words > 5.0 ? raw_score + 3.6365 : raw_score
      end

      # 4.9 and Below Grade 4 and Below
      # 5.0 to 5.9  Grades 5 - 6
      # 6.0 to 6.9  Grades 7 - 8
      # 7.0 to 7.9  Grades 9 - 10
      # 8.0 to 8.9  Grades 11 - 12
      # 9.0 to 9.9  Grades 13 - 15 (College)
      # 10 and Above  Grades 16 and Above (College Graduate)
      def grade
        @grades ||= case score
          when 10.0..100.0
            16
          when 9.0..10.0
            13
          when 8.5..9.0
            12
          when 8.0..8.5
            11
          when 7.5..8.0
            10
          when 7.0..7.5
            9
          when 6.5..7.0
            8
          when 6.0..6.5
            7
          when 5.5..6.0
            6
          when 5.0..5.5
            5
          else
            4
        end
      end

      def process
        grade
      end
    end
  end
end
