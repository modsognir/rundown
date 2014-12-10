Rundown
=======

[![Gem Version](https://badge.fury.io/rb/rundown.png)](http://badge.fury.io/rb/rundown) [![Build Status](https://travis-ci.org/modsognir/rundown.png)](https://travis-ci.org/modsognir/rundown) [![Code Climate](https://codeclimate.com/github/modsognir/rundown.png)](https://codeclimate.com/github/modsognir/rundown) [![Coverage Status](https://coveralls.io/repos/modsognir/rundown/badge.png)](https://coveralls.io/r/modsognir/rundown) [![Dependency Status](https://gemnasium.com/modsognir/rundown.png)](https://gemnasium.com/modsognir/rundown)

Rundown is a simple Natural Language Processor built with Ruby, inspired by [Knwl.js](https://github.com/loadfive/Knwl.js). Rundown scans through text, user data, or just about anything for likely data of interest, phone numbers, dates, locations, emails, times, phrase frequency and overall emotion.

This project is under active development. A lot of methods won't be the most efficient or accurate ways to find the information, however the focus is getting in a good approximation of these functions so as to be usable and further improving on them as we go.

## Installation

Add this line to your application's Gemfile:

    gem 'rundown'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rundown

## Usage

    rd = Rundown.parse("I'll see you on the 18th, give me a ring on 07912 345 678. - Jerertt, me@example.com")

    rd.emails
    => ["me@example.com"]

    rd.phones
    => ["07912 345 678"]

    rd.sentiment
    => -0.5333

    rd.dates
    => [#<Date: 2013-12-18>]

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

###Known Issues

* Phone numbers need country code

###Licence

Project released under an MIT license.


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/modsognir/rundown/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

