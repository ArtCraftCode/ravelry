# Changelog

## 0.1.0

- Return `self` on both `Ravelry::Pattern.get` and `Ravelry::Pattern.permalink_get` (previously returned `data`)
- Add `callback_url` configuration option for OAuth
- Create `Ravelry::Error::Configuration` class for configuration errors
- Add more `Ravelry::Pattern` documentation

## 0.0.9

- Add `json` instance method to `Ravelry::Pattern`

## 0.0.8

- Add `permalink_get` instance method for `Ravelry::Pattern`
- Add `comments` instance method for `Ravely::Pattern`
- Add `Ravelry::Misc.current_user`
- Add all development dependencies to `gemspec`

## 0.0.7

- Add [Patterns#search](http://www.ravelry.com/api#patterns_search) API endpoint (thanks @grampajoe)

## 0.0.6

- Add Needles endpoints:
  - [Needles#list](http://www.ravelry.com/api#needles_list)
  - [Needles#sizes](http://www.ravelry.com/api#needles_sizes)
  - [Needles#types](http://www.ravelry.com/api#needles_types)


