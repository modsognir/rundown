require 'spec_helper'

describe Rundown do
  let(:simple_string) { "I'll see you on the 18th, give me a ring on 07912 345 678. - Jerertt, me@example.com" }
  let(:complex_string) {
    "I'm sorry, I'm extremely busy right now. I just looked at the clock, and it's 12:54 AM,
    I've still got a lot of work to do.  Don't worry about the event tomorrow,
    it's been moved ahead a week, the 28th of december. Remember though,
    you've got to call to get a ticket soon, their # is 1-212-323-1239. Their website says it costs $23 per person.
If you've got enough time, they have some more information on their website, http://theevent.com. @modsognir has tickets already. #prepared
Regards,
David (david32@gmail.com)"
  }

  describe 'emails' do
    it {  expect(Rundown::Processors::Email.new(complex_string).process).to eql ["david32@gmail.com"]}
  end

  describe 'dates' do
    # FIXME: remove dependence on start date knowledge
    year = Time.now.year
    it {  expect(Rundown::Processors::Dates.new(complex_string).process.map(&:start_date).map(&:date)).to include "#{year}1228"}
  end

  describe 'phones' do
    it { expect(Rundown::Processors::Phone.new(complex_string).process).to eql ["+1 (212) 323 1239"]}
  end

  describe 'sentiment' do
    it {  expect(Rundown::Processors::Sentiment.new(complex_string).process.floor).to eql(2) }
  end

  describe 'twitter' do
    it {  expect(Rundown::Processors::Twitter.new(complex_string).process.first).to eql('@modsognir') }
  end

  describe 'links' do
    it {  expect(Rundown::Processors::Links.new(complex_string).process.first).to eql('http://theevent.com') }
  end

  describe 'hashtags' do
    it {  expect(Rundown::Processors::Hashtags.new(complex_string).process.first).to eql('#prepared') }
  end

  describe 'reading grade' do
    it {  expect(Rundown::Processors::ReadingGrade.new(complex_string).process).to eql(7) }
    it {  expect(Rundown::Processors::ReadingGrade.new(complex_string).score.round(2)).to eql(6.46) }
  end

  describe 'frequency (1)' do
    let(:result) { [["im"], ["its"], ["of"], ["youve"], ["website"]] }
    it {  expect(Rundown::Processors::Frequency.new(complex_string).process[2]).to eql(result) }
  end

  describe 'frequency (2)' do
    let(:result) { [["youve", "got"], ["their", "website"]] }
    it {  expect(Rundown::Processors::Frequency.new(complex_string, 2).process[2]).to eql(result) }
  end

  context 'basic string' do
    subject { Rundown.parse(simple_string) }

    it 'extracts emails' do
      expect(subject.emails).to eql(["me@example.com"])
    end

    it 'extracts dates' do
      now = Date.today
      expected = "#{now.year}#{now.month.to_s.rjust(2, '0')}18"
      expect(subject.dates.map(&:start_date).map(&:date)).to eql([expected])
    end

    it 'extracts phone numbers' do
      expect(subject.phones).to eql(["07912345678"])
    end

    it 'extracts sentiment' do
      expect(subject.sentiment).to eql(0.791666666667)
    end

  end

  context 'complex string' do
    subject { Rundown.parse(complex_string) }

    it 'extracts twitter usernames' do
      expect(subject.usernames).to eql(['@modsognir'])
    end

    it 'extracts twitter hashtags' do
      expect(subject.hashtags).to eql(['#prepared'])
    end

  end

end