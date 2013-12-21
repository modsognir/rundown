module Rundown
  class PhoneProcessor < Processor
    attr_accessor :validator, :text

    def initialize(words, validator=Phony)
      @text = words.join(' ')
      @validator = validator
    end

    def plausible?(number)
      validator.plausible?(number)
    end

    def process
      text.scan(/(\+?(\(|\)|[0-9]|\s|-|\.){4,20})/).select {|e| plausible?(e) }
    end
  end
end