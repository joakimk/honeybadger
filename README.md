[Honeybadger](https://honeybadger.io) client for [Elixir](http://elixir-lang.org/).

[CI status](https://circleci.com/gh/joakimk/honeybadger)

**Status**: Work in progress. Will import the basic client from [content\_translator](https://github.com/barsoom/content\_translator).

## Usage

TODO: mix package
TODO: how to add the app
TODO: set HONEYBADGER_API_KEY environment variable

## TODO: Basic version

- [x] add CI
- [x] implement OTP app with the basic error reporting code from content\_translator
- [ ] try to use the app in content\_translator
- [ ] get @version in Honeybadger.ErrorLogger from mix
- [ ] write tests and refactor
- [ ] publish a hex package
- [ ] document how to use it
- [ ] tweet about it, notify honeybadger to update links

## TODO: Proper version

- [ ] Report stacktrace, etc.
- [ ] CI with multiple elixir/erlang versions
- [ ] See if there is a better way to pass in HONEYBADGER_API_KEY

## Contributing

* Pull requests:
  - Are very welcome :)
  - Should have tests
  - Should have refactored code that conforms to the style of the project
  - Should have updated documentation
  - Should implement or fix something that makes sense for this library (feel free to ask if you are unsure)
  - Will only be merged if all the above is fulfilled. I won't fix your code, but I will try and give feedback.
* If this project ever becomes too inactive, feel free to ask about taking over as as maintainer.
