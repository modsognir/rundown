module Rundown
  class Processor
    attr_accessor :words, :text

    PUNCTUATION = /[\s`!()\[\]{}\-;:'".,<>?]/

    def initialize(words)
      @text = words
      @words = @text.to_s.split(/\s/)
    end

    def sentences
      @sentences ||= text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
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