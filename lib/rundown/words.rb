module Rundown
  class Words < SimpleDelegator
    attr_accessor :text
    
    def initialize(text)
      @text = text
      __setobj__(split(text))
    end

  private

    def split(text)
      text.scan(/[a-zA-Z0-9_\u0392-\u03c9]+|[\u4E00-\u9FFF\u3400-\u4dbf\uf900-\ufaff\u3040-\u309f\uac00-\ud7af]+/)
    end
  end
end