require_relative './judgment_logic_generator'
require_relative './false_class'
require_relative './true_class'
require_relative './list'

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
  g = FizzBuzzGenerator.new
  j = Judgement.new
  judgement_logic_generator = JudgmentLogicGenerator.new

  raise ArgumentError, 'nはnilであってはなりません' if n.eql?(nil)
  raise ArgumentError, 'nは数値である必要があります' unless n.is_a?(Numeric)
  raise ArgumentError, 'nは1以上の整数である必要があります' if n <= 0
  raise ArgumentError, 'nは整数である必要があります' unless n.integer?

  # 100までの数字はこっちで動く
  return g.fizz_buzz if judgement_logic_generator.fizz_buzz(n).call.真? == 'はい'
  return g.fizz unless j.judgement { `if [ $((#{n} % 3)) = 0 ]; then echo true; else echo false; fi`.chomp == 'true' }
  return g.buzz unless j.judgement { `if [ $((#{n} % 5)) = 0 ]; then echo true; else echo false; fi`.chomp == 'true' }

  n.to_s
end

class Judgement
  # 好きな分岐を作ろう
  def judgement
    yield.!
  end
end

class FizzBuzzGenerator
  def fizz
    'Fizz'
  end

  def buzz
    'Buzz'
  end

  def fizz_buzz
    fizz + buzz
  end
end
