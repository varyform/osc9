# frozen_string_literal: true

require "test_helper"

class TestOsc9 < Minitest::Test
  def setup
    @io = StringIO.new
    @progress = OSC::Progress.new(io: @io)
  end

  def test_that_it_has_a_version_number
    refute_nil ::Osc9::VERSION
  end

  def test_progress
    @progress.progress(20)

    assert_equal "\e]9;4;1;20\e\\", @io.string
  end

  def test_clamping
    @progress.progress(120)

    assert_equal "\e]9;4;1;100\e\\", @io.string
  end

  def test_error
    @progress.error(45)

    assert_equal "\e]9;4;2;45\e\\", @io.string
  end

  def test_reset
    @progress.reset

    assert_equal "\e]9;4;0;\e\\", @io.string
  end

  def test_indeterminate
    @progress.indeterminate

    assert_equal "\e]9;4;3;\e\\", @io.string
  end
end
