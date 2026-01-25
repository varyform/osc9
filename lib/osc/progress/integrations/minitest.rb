require "minitest"
require_relative "../../progress"

module Minitest
  class OscProgressReporter < Reporter
    def initialize(io = $stdout, options = {})
      super

      @osc_progress = OSC::Progress.new(io: io)
      @total = nil
      @count = 0
      @has_failure = false
      @mutex = Mutex.new
    end

    def start
      super

      @total = Minitest::Runnable.runnables.sum { |runnable| runnable.runnable_methods.size }
    end

    def record(result)
      super

      @mutex.synchronize do
        @count += 1

        @has_failure = true unless result.passed? || result.skipped?

        if @total && @total > 0
          percent = (@count * 100) / @total

          if @has_failure
            @osc_progress.error(percent)
          else
            @osc_progress.progress(percent)
          end
        end
      end
    end
  end

  def self.plugin_osc_progress_init(options)
    self.reporter.reporters << OscProgressReporter.new
  end
end

Minitest.after_run { OSC::Progress.new.reset }
Minitest.extensions << "osc_progress"
