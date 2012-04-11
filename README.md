# cucumber-pride

Take pride in your test output!

Mimics the functionality of `minitest/pride` for Cucumber, in much the same way that `ferrous26/rspec-pride` does for RSpec2.

## How to use cucumber-pride

To use cucumber-pride, you need to call `cucumber` kind of like this:

    cucumber --format Cucumber::Pride::Formatter

Or put those options in your `config/cucumber.yml` file.

## Installation

Add this line to your application's Gemfile:

    gem 'cucumber-pride'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cucumber-pride

## Usage

TODO: Write usage instructions here

## Acknowledgements

* Main inspiration, and a fair amount of code, comes from the brilliant [`rspec-pride`](https://github.com/ferrous26/rspec-pride/) gem by [Mark Rade (ferrous26)](https://github.com/ferrous26).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

<a name="copyright"/>

## Copyright

Copyright (c) 2012 Peter Vandenberk. See LICENSE.txt for further details.

