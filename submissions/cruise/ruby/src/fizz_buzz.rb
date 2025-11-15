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
def fizz_buzz(n)
  raise ArgumentError, "nはnilであってはなりません" if n.nil?
  raise ArgumentError, "nは数値である必要があります" unless n.is_a?(Numeric)
  raise ArgumentError, "nは1以上の整数である必要があります" if n <= 0
  raise ArgumentError, "nは整数である必要があります" unless n.integer?

  return "FizzBuzz" if (n % 15).zero?
  return "Fizz" if (n % 3).zero?
  return "Buzz" if (n % 5).zero?

  n.to_s
end
