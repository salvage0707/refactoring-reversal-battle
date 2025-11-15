# frozen_string_literal: true

# メタプログラミングで謎のメソッド定義（パターン: メタプログラミング乱用）
module PalindromeMethodDispatcher
  # class_evalで動的にコードを実行
  def self.define_palindrome_method(target_module)
    method_body = <<~RUBY
      def palindrome?(str)
        # sendで動的にメソッドを呼び出し
        validation_result = self.__send__(:__validate_palindrome_internal__, str)
        validation_result
      end
    RUBY

    target_module.class_eval(method_body)
  end

  # class_evalで動的にコードを実行してメソッドを定義
  def self.define_internal_validation_method(target_module)
    internal_method = <<~RUBY
      def __validate_palindrome_internal__(str)
        # const_getで動的に定数を取得（実際には使わないがメタプロの例として）
        error_class = Object.const_get(:ArgumentError)

        # sendで動的にメソッドを呼び出し
        if str.__send__(:nil?)
          Kernel.__send__(:raise, error_class.__send__(:new, "strはnilであってはなりません"))
        end

        unless str.__send__(:is_a?, String)
          Kernel.__send__(:raise, error_class.__send__(:new, "strは文字列である必要があります"))
        end

        # methodを使ってメソッドオブジェクトを取得して呼び出し
        downcase_method = str.method(:downcase)
        normalized = downcase_method.call

        # sendでreverseを呼び出し
        reversed = normalized.__send__(:reverse)

        # sendで==を呼び出し
        normalized.__send__(:==, reversed)
      end
    RUBY

    target_module.class_eval(internal_method)
  end
end

# さらに謎のメタプログラミング：モジュールを経由してメソッドを定義
module PalindromeFunctionModule
  # module_evalで動的にコードを実行
  PalindromeFunctionModule.module_eval do
    PalindromeMethodDispatcher.define_internal_validation_method(self)
    PalindromeMethodDispatcher.define_palindrome_method(self)
  end
end

# グローバルスコープにメソッドを展開
include PalindromeFunctionModule
