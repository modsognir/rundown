require 'spec_helper'

describe Rundown do
  subject {
    "I'm sorry, I'm extremely busy right now. I just looked at the clock, and it's 12:54 AM, I've still got a lot of work to do.  Don't worry about the event tomorrow, it's been moved ahead a week, the 28th of december. Remember though, you've got to call to get a ticket soon, their # is 1-212-323-1239. Their website says it costs $23 per person.
If you've got enough time, they have some more information on their website, http://theevent.com. @modsognir has tickets already.
Regards,
David (david32@gmail.com)"
  }

  describe 'emails' do
    it {  expect(Rundown::Processors::Email.new(subject).process).to eql ["david32@gmail.com"]}
  end

  describe 'dates' do
    # FIXME: remove dependence on start date knowledge
    year = Time.now.year
    it {  expect(Rundown::Processors::Dates.new(subject).process.map(&:start_date).map(&:date)).to include "#{year}1228"}
  end

  describe 'phones' do
    it { expect(Rundown::Processors::Phone.new(subject).process).to eql ["+1 212 323 1239"]}
  end

  describe 'sentiment' do
    it {  expect(Rundown::Processors::Sentiment.new(subject).process.floor).to eql(2) }
  end

  describe 'twitter' do
    it {  expect(Rundown::Processors::Twitter.new(subject).process.first).to eql('@modsognir') }
  end

  describe 'links' do
    it {  expect(Rundown::Processors::Links.new(subject).process.first).to eql('http://theevent.com') }
  end

  context 'basic string' do
    subject { Rundown.parse("I'll see you on the 18th, give me a ring on 07912 345 678. - Jerertt, me@example.com") }

    it 'extracts emails' do
      expect(subject.emails).to eql(["me@example.com"])
    end

    it 'extracts phone numbers' do
      expect(subject.phones).to eql(["07912345678"])
    end

    it 'extracts sentiment' do
      expect(subject.sentiment).to eql(0.791666666667)
    end
  end

end