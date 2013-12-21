require 'spec_helper'

module Rundown
  module Processors
    describe Dates do
      describe 'month' do
        {
          "I will see you on 12/15/2013" => Date.new(2013, 12, 15),
          " the 28th of december." => Date.new(Time.now.year, 12, 28)
        }.each do |input, expected|
          it "parse '#{input}' to '#{expected}'" do
            expect(Rundown::Processors::Dates.new(input).process.first.start_date.to_date).to eql(expected)
          end
        end
      end
    end
  end
end