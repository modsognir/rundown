module Rundown
  class Parser
    attr_accessor :text
    
    def initialize(text)
      @text = text
    end

    # def processors
    #   [
    #     ,
    #     Processors::Email,
    #     Processors::Phone,
    #     Processors::Sentiment
    #   ]
    # end

    def dates
      @dates ||= Processors::Dates.new(text).process
    end

    def emails
      @email ||= Processors::Email.new(text).process
    end

    def phones
      @phone ||= Processors::Phone.new(text).process
    end

    def sentiment
      @sentiment ||= Processors::Sentiment.new(text).process
    end
  end
end