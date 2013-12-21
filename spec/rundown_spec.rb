require 'spec_helper'

describe Rundown do
  subject {
    "I'm sorry, I'm extremely busy right now. I just looked at the clock, and it's 12:54 AM, I've still got a lot of work to do.  Don't worry about the event tomorrow, it's been moved ahead a week, the 28th of december. Remember though, you've got to call to get a ticket soon, their # is 1-212-323-1239. Their website says it costs $23 per person.
If you've got enough time, they have some more information on their website, http://theevent.com.
Regards,
David (david32@gmail.com)".split(/\s/)
  }

  describe 'emails' do
    it {  expect(Rundown::EmailProcessor.new(subject).process).to eql ["david32@gmail.com"]}
  end

  describe 'dates' do
    # FIXME: remove dependence on start date knowledge
    it {  expect(Rundown::DateProcessor.new(subject).process.map(&:start_date).map(&:date)).to include "20131228"}
  end

  describe 'phones' do
    it { pending; expect(Rundown::PhoneProcessor.new(subject).process).to eql ["212-323-1239"]}
  end

  describe 'sentiment' do
    it {  expect(Rundown::SentimentProcessor.new(subject).process.floor).to eql(2) }
  end

end