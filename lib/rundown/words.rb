module Rundown
  class Words < SimpleDelegator
    attr_accessor :text
    
    def initialize(text)
      @text = text
      __setobj__(text.split(" "))
    end
  end
end