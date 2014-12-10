require 'csv'
require 'delegate'
require 'phony'
require 'nickel'
require 'sentiment_parser'

require 'rundown/parser'
require 'rundown/processor'
require 'rundown/processors/dates'
require 'rundown/processors/email'
require 'rundown/processors/frequency'
require 'rundown/processors/hashtags'
require 'rundown/processors/links'
require 'rundown/processors/phone'
require 'rundown/processors/reading_time'
require 'rundown/processors/reading_grade'
require 'rundown/processors/sentiment'
require 'rundown/processors/twitter'

module Rundown
  module_function

  def parse(text)
    Parser.new(text)
  end
end