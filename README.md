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

Install ruby-1.9.3-p327 to ~/.llenv/ruby-1.9.3-p327/, and also `bundle install` required modules to your-project/vendor/bundle. See [install script](https://github.com/riywo/llenv-declare/blob/master/.lib/ruby/install).

    $ cd your-project
    $ echo ruby-1.9.3-p327 > .llenv
    $ llenv install

Execute any command. See [exec script](https://github.com/riywo/llenv-declare/blob/master/.lib/ruby/exec).

    $ cd your-project
    $ llenv exec ruby -v
    $ llenv exec rackup

## ENV

### `LLENV_ROOT`

Root directory installed all LLs. Default: "~/.llenv"

### `LLENV_DECLARE_URL`

Declare repository URL. Default: [https://github.com/riywo/llenv-declare.git](https://github.com/riywo/llenv-declare.git)

### `LLENV_ENV`

For passing user environment variables to inside of llenv.

    $ LLENV_ENV=PORT=1234,LOGDIR=/var/log/log llenv exec env
    PORT=1234
    LOGDIR=/var/log/log
    ...

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
