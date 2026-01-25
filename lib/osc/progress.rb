# frozen_string_literal: true

module OSC
  # Progress reporter using OSC9 escape sequences for terminal integration.
  # Supports progress bars in compatible terminals like iTerm2 and Ghostty.
  class Progress
    RESET = 0
    PROGRESS = 1
    ERROR = 2
    INDETERMINATE = 3

    def initialize(io: $stdout) = @io = io

    def reset = emit(RESET)
    def progress(percent) = emit(PROGRESS, percent.clamp(0, 100))
    def error(percent) = emit(ERROR, percent.clamp(0, 100))
    def indeterminate = emit(INDETERMINATE)

    private

    def emit(state, value = nil)
      @io.print("\e]9;4;#{state};#{value}\e\\")
      @io.flush
    end
  end
end
