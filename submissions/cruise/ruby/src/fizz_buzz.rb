# frozen_string_literal: true

# FizzBuzz関数
# 1からnまでの数値に対して、以下のルールに従って文字列を返す:
# - 3の倍数の場合: "Fizz"
# - 5の倍数の場合: "Buzz"
# - 3と5の両方の倍数の場合: "FizzBuzz"
# - それ以外の場合: 数値を文字列として返す
#
# @param n [Integer] 処理する数値
# @return [String] FizzBuzzルールに従った文字列
# @raise [ArgumentError] nがnil、負の数、0、または数値以外の場合

require_relative 'class/extend_int'
require_relative 'class/executor'
require_relative 'class/executor/fizz'
require_relative 'class/executor/buzz'
require_relative 'class/executor/fizz_buzz'
require_relative 'class/validator'

# 参考文献
# Jeremy Evans（2023）『研鑽Rubyプログラミング』角谷信太郎 訳

def fizz_buzz(target_number)
  validator = Validator.new(target_number)
  validator.valid?(target_number)

  return "FizzBuzz" unless !FizzBuzz.new(target_number).is_fizzbuzz?
  return "Fizz" unless !Fizz.new(target_number).is_fizz?
  return "Buzz" unless !Buzz.new(target_number).is_buzz?

  target_number.to_s
end
