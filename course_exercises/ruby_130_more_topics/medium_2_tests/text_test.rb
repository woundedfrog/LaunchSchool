require "minitest/autorun"
require_relative "text"

class TextTest < MiniTest::Test
  def setup
    @file = File.open('swap_letter_text.txt', 'r')
  end

  def test_swap
    text = Text.new(@file.read)
    refute_includes(text.swap('a', 'e'), 'a')
  end

  def test_word_count
    text = Text.new(@file.read)
    assert_equal(72, text.word_count)
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end