# Ravelry

The Ruby gem for accessing the Ravelry API painlessly, easily, and awesomely. Made by a knitter, knitwear designer, and hacker all rolled into one sassy woman so you know it's good (ish).

Ravelry API documentation is currently available [here](http://www.ravelry.com/api). I would recommend parsing through it because it's very useful.

The goal of this gem is to provide 100% API coverage. It doesn't just yet, but it will. Eventually. 

### Installation

Welcome to a magical land where gems rule the world. To install, type:

```
gem install ravelry
```

Hooray! You now have a gem.

Add to your `Gemfile`:

```
gem "ravelry"
```

#### Requirements

You will need to set the follow environment variables:

* `RAV_ACCESS` - your Ravelry access key
* `RAV_SECRET` - your Ravelry secret key
* `RAV_PERSONAL` - wait for it! Your Ravelry personal key

Getting these keys requires a (free) Ravelry account and that you agree to the terms of use for the API.

# Usage

Documentation is currently located in the [Github wiki](https://github.com/feministy/ravelry/wiki).

#### A note on Ruby versions

Currently, 1.9.3 is the only tested and supported version of Ruby. This is not because I'm lazy or emotionally attached to 1.9.3, it's because my personal machine is very very old and is borked and doesn't want to play nicely with Ruby 2.0.0.

This code should, however, work just fine with Ruby 2.0.0. If it doesn't, whoops. Sorry! Submit a pull request to fix it :)

# Contributing

Hey! You want to contribute? That is super, super awesome.

Send me a pull request! Note that your pull request will not be accepted if you don't write tests **and documentation** for your code (the test part kind of goes without saying, but I wanted to make sure that you knew about it and the documentation). 

To run specs locally, simply `bundle` and then run `rpsec`.