require 'spec_helper'

module Rundown
  module Processors
    describe ReadingTime do
      describe 'reading time' do
        {
          "I will see you on 12/15/2013" => 1.87,
          " the 28th of december." => 1.56
        }.each do |input, expected|
          it "parse '#{input}' to '#{expected}'" do
            expect(Rundown::Processors::ReadingTime.new(input).process.round(2)).to eql(expected)
          end
        end
      end
    end
  end
end