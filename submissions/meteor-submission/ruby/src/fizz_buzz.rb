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
  begin
    raise kihon_no_reigai, "nはnilであってはなりません" if n.nil?
    raise suuti_no_exception unless n.is_a?(Numeric)
    raise n_1ijou if n <= 0
    raise n_seisu unless n.integer?
    return "FizzBuzz" if (n % 15).zero?
    return "Fizz" if (n % 3).zero?
    return "Buzz" if (n % 5).zero?

    n.to_s
  rescue => kihon_no_reigai
    raise ArgumentError
  rescue => suuti_no_exception
    raise ArgumentError
  rescue => n_1ijou
    raise ArgumentError
  rescue => n_seisu
    raise ArgumentError
  end
end

