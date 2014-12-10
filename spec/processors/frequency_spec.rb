require 'spec_helper'

module Rundown
  module Processors
    describe Frequency do
      let(:text) do
        %q(
          Recursion is the process of repeating items in a self-similar way. For
          instance, when the surfaces of two mirrors are exactly parallel with
          each other, the nested images that occur are a form of infinite recursion.
          The term has a variety of meanings specific to a variety of disciplines
          ranging from linguistics to logic. The most common application of recursion
          is in mathematics and computer science, in which it refers to a method of
          defining functions in which the function being defined is applied within
          its own definition. Specifically, this defines an infinite number of
          instances (function values), using a finite expression that for some
          instances may refer to other instances, but in such a way that no loop or
          infinite chain of references can occur. The term is also used more
          generally to describe a process of repeating objects in a self-similar way.
        )
      end

      describe '1 word phrase frequency' do
        subject { described_class.new(text, 1).process }

        it 'should be like this' do
          expect(subject[10]).to eql([['of']])
          expect(subject[3]).to eql([['recursion'], ['way'], ['that'], ['infinite'], ['instances']])
        end
      end

      describe '2 word phrase frequency' do
        subject { described_class.new(text, 2).process }

        it 'should be like this' do
          expect(subject[2]).to eql([["recursion", "is"], ["process", "of"], ["of", "repeating"], ["in", "a"], ["a", "selfsimilar"], ["selfsimilar", "way"], ["the", "term"], ["a", "variety"], ["variety", "of"], ["to", "a"], ["in", "which"]])
        end
      end
    end
  end
end