module Rundown
  class Processor
    attr_accessor :words

    PUNCTUATION = /[\s`!()\[\]{}\-;:'".,<>?]/

    def initialize(words)
      @words = words.to_s.split(/\s/)
    end

  private

    def strip_punctuation(word)
      word.gsub(/^#{PUNCTUATION}/, '').gsub(/#{PUNCTUATION}$/, '')
    end

    def remove_punctuation(word)
      word.gsub(/#{PUNCTUATION}/, '')
    end
  end
end