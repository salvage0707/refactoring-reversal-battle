# frozen_string_literal: true

require "minitest/autorun"
require_relative "fizz_buzz"

class FizzBuzzTest < Minitest::Test
  def test_1を渡すと1を返す
    assert_equal "1", fizz_buzz(1)
  end

  def test_2を渡すと2を返す
    assert_equal "2", fizz_buzz(2)
  end

  def test_3を渡すとFizzを返す
    assert_equal "Fizz", fizz_buzz(3)
  end

  def test_4を渡すと4を返す
    assert_equal "4", fizz_buzz(4)
  end

  def test_5を渡すとBuzzを返す
    assert_equal "Buzz", fizz_buzz(5)
  end

  def test_6を渡すとFizzを返す
    assert_equal "Fizz", fizz_buzz(6)
  end

  def test_9を渡すとFizzを返す
    assert_equal "Fizz", fizz_buzz(9)
  end

  def test_10を渡すとBuzzを返す
    assert_equal "Buzz", fizz_buzz(10)
  end

  def test_15を渡すとFizzBuzzを返す
    assert_equal "FizzBuzz", fizz_buzz(15)
  end

  def test_30を渡すとFizzBuzzを返す
    assert_equal "FizzBuzz", fizz_buzz(30)
  end

  def test_45を渡すとFizzBuzzを返す
    assert_equal "FizzBuzz", fizz_buzz(45)
  end

  def test_100を渡すとBuzzを返す
    assert_equal "Buzz", fizz_buzz(100)
  end

  def test_nilを渡すとArgumentErrorを発生させる
    assert_raises(ArgumentError) { fizz_buzz(nil) }
  end

  def test_0を渡すとArgumentErrorを発生させる
    assert_raises(ArgumentError) { fizz_buzz(0) }
  end

  def test_負の数を渡すとArgumentErrorを発生させる
    assert_raises(ArgumentError) { fizz_buzz(-1) }
    assert_raises(ArgumentError) { fizz_buzz(-15) }
  end

  def test_文字列を渡すとArgumentErrorを発生させる
    assert_raises(ArgumentError) { fizz_buzz("15") }
  end

  def test_浮動小数点数を渡すとArgumentErrorを発生させる
    assert_raises(ArgumentError) { fizz_buzz(15.5) }
  end
end
