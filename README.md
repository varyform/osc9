# Osc9

OSC 9 Progress bar support for Ruby.

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add osc9
```

## Usage

### OSC Progress

```ruby
progress = OSC::Progress.new
progress.progress(50)
progress.error(50)
progress.indeterminate
progress.reset
```

### Minitest Integration

To use the OSC Progress reporter with Minitest, require the integration file in your `test_helper.rb`:

```ruby
require "osc/progress/integrations/minitest"
```

This will automatically register the reporter.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
