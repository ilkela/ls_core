require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require_relative 'swap_letters'

class SwapLettersTest < Minitest::Test
  def setup
    @file = File.open('./swap_letters_text.txt', 'r')
  end

  def test_swap
    original_text = Text.new(@file.read)
    swapped_text = <<~TEXT.chomp
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    TEXT

    assert_equal(swapped_text, original_text.swap('a', 'e'))
    # refute(original_text.swap('a', 'e').include?("a"))
  end

  def test_word_count
    original_text = Text.new(@file.read)

    assert_equal(72, original_text.word_count)
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end