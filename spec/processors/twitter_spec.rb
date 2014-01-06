require 'spec_helper'

module Rundown
  module Processors
    describe Twitter do
      describe 'month' do
        {
          "follow me on @modsognir" => "@modsognir",
          " I don't know what @parndt is doing" => "@parndt"
        }.each do |input, expected|
          it "parse '#{input}' to '#{expected}'" do
            expect(Rundown::Processors::Twitter.new(input).process.first).to eql(expected)
          end
        end
      end

    end
  end
end