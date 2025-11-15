# frozen_string_literal: true

require "minitest/autorun"
require_relative "palindrome"

class PalindromeTest < Minitest::Test
  def test_空文字列は回文である
    assert_equal true, palindrome?("")
  end

  def test_1文字の文字列は回文である
    assert_equal true, palindrome?("a")
    assert_equal true, palindrome?("A")
  end

  def test_levelは回文である
    assert_equal true, palindrome?("level")
  end

  def test_racecarは回文である
    assert_equal true, palindrome?("racecar")
  end

  def test_madamは回文である
    assert_equal true, palindrome?("madam")
  end

  def test_大文字小文字が混在していても回文として判定される
    assert_equal true, palindrome?("Level")
    assert_equal true, palindrome?("RACEcar")
    assert_equal true, palindrome?("MaDaM")
  end

  def test_helloは回文ではない
    assert_equal false, palindrome?("hello")
  end

  def test_worldは回文ではない
    assert_equal false, palindrome?("world")
  end

  def test_abcは回文ではない
    assert_equal false, palindrome?("abc")
  end

  def test_abbaは回文である
    assert_equal true, palindrome?("abba")
  end

  def test_abcbaは回文である
    assert_equal true, palindrome?("abcba")
  end

  def test_日本語の回文も判定できる
    assert_equal true, palindrome?("しんぶんし")
    assert_equal true, palindrome?("たけやぶやけた")
  end

  def test_数字を含む回文も判定できる
    assert_equal true, palindrome?("12321")
    assert_equal false, palindrome?("12345")
  end

  def test_空白を含む文字列も判定できる
    assert_equal true, palindrome?("a a")
    assert_equal false, palindrome?("a b")
  end

  def test_nilを渡すとArgumentErrorを発生させる
    assert_raises(ArgumentError) { palindrome?(nil) }
  end

  def test_数値を渡すとArgumentErrorを発生させる
    assert_raises(ArgumentError) { palindrome?(12321) }
  end

  def test_配列を渡すとArgumentErrorを発生させる
    assert_raises(ArgumentError) { palindrome?(["a", "b", "a"]) }
  end
end
