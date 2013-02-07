require 'helper'
require 'pp'
require 'stringio'

#class DiffAll
#  public :add
#end

class TestDiffall < Test::Unit::TestCase

  def setup
    @da00 = DiffAll.new

    @da01 = DiffAll.new(["test/files/12_a", "test/files/1_a", "test/files/1_b"])
  end

  def test_initialize
    da00 = DiffAll.new
    assert_equal({}, da00.hashtags)

    da01 = DiffAll.new(["test/files/12_a", "test/files/1_a", "test/files/1_b"])
    corrects = {
      "test/files/12_a" =>
        "a1fb50e6c86fae1679ef3351296fd6713411a08cf8dd1790a4fd05fae8688164",
      "test/files/1_a" =>
        "4355a46b19d348dc2f57c046f8ef63d4538ebb936000f3c9ee954a27460dd865",
      "test/files/1_b" =>
        "4355a46b19d348dc2f57c046f8ef63d4538ebb936000f3c9ee954a27460dd865",
    }
    assert_equal(corrects, da01.hashtags)
  end

  def test_self_read_io
    io = StringIO.new
    io.puts "4355a46b19d348dc2f57c046f8ef63d4538ebb936000f3c9ee954a27460dd865  test/files/1_a"
    io.puts "a1fb50e6c86fae1679ef3351296fd6713411a08cf8dd1790a4fd05fae8688164  test/files/12_a"
    io.rewind
    da02 = DiffAll.read_io io
  end

  def test_add
    #pp @da00.class
    @da00.add "4355a46b19d348dc2f57c046f8ef63d4538ebb936000f3c9ee954a27460dd865  test/files/1_a"
    @da00.add "a1fb50e6c86fae1679ef3351296fd6713411a08cf8dd1790a4fd05fae8688164  test/files/12_a"
    corrects = {
      "test/files/1_a" =>
        "4355a46b19d348dc2f57c046f8ef63d4538ebb936000f3c9ee954a27460dd865",
      "test/files/12_a" =>
        "a1fb50e6c86fae1679ef3351296fd6713411a08cf8dd1790a4fd05fae8688164",
    }
    assert_equal(corrects, @da00.hashtags)
  end

  def test_show
    options = {
      :filename => false,
      :last_hide => false,
    }
    io = StringIO.new
    @da01.show(options, io)
    io.rewind
    results = io.readlines
    corrects = [
      "4355a46b19d348dc2f57c046f8ef63d4538ebb936000f3c9ee954a27460dd865\n",
      "  test/files/1_a\n",
      "  test/files/1_b\n",
    ]
    assert_equal(corrects, results)

    options = {
      :filename  => true,
      :last_hide => false,
    }
    io = StringIO.new
    @da01.show(options, io)
    io.rewind
    results = io.readlines
    corrects = [
      "test/files/1_a\n",
      "test/files/1_b\n",
    ]
    assert_equal(corrects, results)

    options = {
      :filename  => false,
      :last_hide => true,
    }
    io = StringIO.new
    @da01.show(options, io)
    io.rewind
    results = io.readlines
    corrects = [
      "4355a46b19d348dc2f57c046f8ef63d4538ebb936000f3c9ee954a27460dd865\n",
      "  test/files/1_a\n",
    ]
    assert_equal(corrects, results)

    options = {
      :filename  => true,
      :last_hide => true,
    }
    io = StringIO.new
    @da01.show(options, io)
    io.rewind
    results = io.readlines
    corrects = [
      "test/files/1_a\n",
    ]
    assert_equal(corrects, results)
  end

end
