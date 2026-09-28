# osc9

[OSC 9](https://conemu.github.io/en/AnsiEscapeCodes.html#OSC_Operating_system_commands) (Operating System Command) ANSI escape sequence for supporting terminals ([iTerm2](https://iterm2.com/), [Ghostty](https://ghostty.org/), etc.) 

So far only progress bar is supported.

https://github.com/user-attachments/assets/dd562ffe-094e-4376-a5ac-b8de7b78c92c
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
require "osc/progress/integrations/minitest" if STDOUT.isatty
```

This will automatically register the reporter.

To test the integration, you can run the following command:

```bash
DEMO=1 rake test
```
