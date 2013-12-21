require 'csv'
require 'delegate'
require 'phony'
require 'nickel'
require 'sentiment_parser'

require 'rundown/parser'
require 'rundown/processor'
require 'rundown/processors/email'
require 'rundown/processors/dates'
require 'rundown/processors/phone'
require 'rundown/processors/sentiment'

module Rundown
  module_function

  def parse(text)
    Parser.new(text)
  end
end