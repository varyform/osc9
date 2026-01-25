# osc9

[OSC 9](https://conemu.github.io/en/AnsiEscapeCodes.html#OSC_Operating_system_commands) Progress bar support for Ruby.

https://github.com/user-attachments/assets/98515154-628c-4338-bc43-42705bc38652

## Installation

```ruby
group :test do
  gem "osc9", github: "varyform/osc9"
end
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
