# Ravelry

_You are reading documentation for version: 0.2.0_

[ ![Codeship Status for ArtCraftCode/ravelry](https://app.codeship.com/projects/afe1a750-3f22-0135-26c6-7e3d37d99ae1/status?branch=pre)](https://codeship.com/projects/229699)

The Ruby gem for accessing the Ravelry API painlessly, easily, and awesomely! This gem is actively being developed. **Be sure to check the branch for the version you're using.**

**Important and helpful links:**

- [Full gem documentation (version 0.2.0)](http://www.rubydoc.info/gems/ravelry/0.2.0)
- [Changelog](https://github.com/ArtCraftCode/ravelry/blob/0.2.0/CHANGELOG.md)
- [Project Trello board](https://trello.com/b/o8gs4cWI/ravelry)
- [Ravelry API documentation](http://www.ravelry.com/api)

## API coverage

See [documentation](http://www.rubydoc.info/gems/ravelry/0.2.0) for each class (or module) to see how to initialize the objects.

API | Endpoint | Ravelry gem class / module
----|----------|------------------
**Misc** | [color_families](http://www.ravelry.com/api#/_color_families) | `Ravelry::Misc.color_families`
**Misc** | [yarn_weights](http://www.ravelry.com/api#/_yarn_weights) | `Ravelry::Misc.yarn_weights`
**Misc** | [current_user](http://www.ravelry.com/api#/_current_user) | `Ravelry::Misc.current_user`
**Needles** | [list](http://www.ravelry.com/api#needles_list) | `Ravelry::Needles.list`
**Needles** | [sizes](http://www.ravelry.com/api#needles_sizes) | `Ravelry::Needles.sizes`
**Needles** | [types](http://www.ravelry.com/api#needles_types) | `Ravelry::Needles.types`
**Patterns** | [comments](http://www.ravelry.com/api#patterns_comments) | `Ravelry::Pattern.comments`
**Patterns** | [search](http://www.ravelry.com/api#patterns_search) | `Ravelry::Pattern.search`
**Patterns** | [show](http://www.ravelry.com/api#patterns_show) | `Ravelry::Pattern.get`
**People** | [show](http://www.ravelry.com/api#people_show) | `Ravelry::User.get`

# Installation

To install, type:

```
gem install ravelry
```

Hooray! You now have a gem.

Add to your `Gemfile`:

```ruby
gem "ravelry", "~> 0.2.0"
```

**I highly recommend pinning your version** because the gem is in active development and small changes and additions will be made regularly.

Run `bundle install` and proceed as usual.

# Configuration

API keys *must* be configured in the gem setup. You can do this anywhere in your application before you make API calls using the gem.

```ruby
Ravelry.configure do |config|
  config.access_key = ''
  config.secret_key = ''
  config.personal_key = ''
  config.callback_url = ''
end
```

* `config.access_key` - your Ravelry access key
* `config.secret_key` - your Ravelry secret key
* `config.personal_key` - wait for it! Your Ravelry personal key; primarily used for OAuth (not yet implemented in the gem)
* `config.callback_url` - for OAuth, the callback url for your authentication requests

Getting these keys requires a (free) Ravelry account and that you agree to the terms of use for the API.

The keys are available to you throughout your application as:

```ruby
Ravelry.configuration.access_key
Ravelry.configuration.secret_key
Ravelry.configuration.personal_key
Ravelry.configuration.callback_url
```

# Usage

Full documentation for this gem is available [here](http://www.rubydoc.info/gems/ravelry/0.2.0).

# Conventions

This gem makes use of several conventions that are worth noting on a global scale.

## Method names ending with `_count` return integers.

Example:

```ruby
pattern.comments_count
# => 4
```

## Method names ending with `_float`, `_integer`, etc return that object type.

Float to Integer conversions are done using round(0).

Example:

```ruby
pattern.difficulty_average_float
# => 4.666666667

pattern.difficulty_average_integer
# => 5
```

# Contributing

Hey! You want to contribute? That is super, super awesome. Visit the project's [Trello board](https://trello.com/b/o8gs4cWI/ravelry) to see what's coming up next or what is already in progress.

Send me a pull request! Please write tests, **documentation** for your code (the test part kind of goes without saying, but I wanted to make sure that you knew about it and the documentation), and update the changelog with your additions under the next unreleased version.

To run specs locally, simply `bundle` and then run `rpsec`.

Documentation is generated by YARD and is producted using inline comments. Comments use Markdown syntax. You can run `yard server` to get a live server of documentation while you're working :)
