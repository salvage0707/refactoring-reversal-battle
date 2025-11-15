# frozen_string_literal: true

# 回文チェック関数
# 文字列が回文（前から読んでも後ろから読んでも同じ文字列）かどうかを判定する
# 大文字小文字は区別しない
#
# @param str [String] チェックする文字列
# @return [Boolean] 回文の場合true、そうでない場合false
# @raise [ArgumentError] strがnil、または文字列以外の場合
def palindrome?(str)
  raise ArgumentError, "strはnilであってはなりません" if str.nil?
  raise ArgumentError, "strは文字列である必要があります" unless str.is_a?(String)

  normalized = str.downcase
  normalized == normalized.reverse
end
