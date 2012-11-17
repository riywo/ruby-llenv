# LLenv

LL install and exec manager

## Installation

Add this line to your application's Gemfile:

    gem 'ruby-llenv'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby-llenv

## Usage

    $ cd your-project
    $ echo ruby-1.9.3-p327 > .llenv
    $ llenv install

Install ruby-1.9.3-p327 to ~/.llenv/ruby-1.9.3-p327/, and also `bundle install` required modules to your-project/vendor/bundle. See [install.sh](https://github.com/riywo/ruby-llenv/blob/master/declare/ruby-1.9.3-p327/install.sh).

    $ cd your-project
    $ llenv exec rackup

See [exec.sh](https://github.com/riywo/ruby-llenv/blob/master/declare/ruby-1.9.3-p327/exec.sh).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
