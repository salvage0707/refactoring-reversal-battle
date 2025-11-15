# frozen_string_literal: true

class Fizz < Executor
  # pp 75 「Rubyでクラス変数は使うべきでない機能のひとつ」
  
  @@divisor = 'fiz'.length # スペイン語「割られる数」

  def initialize(dividendo)
    @target_number = dividendo # スペイン語「割る数」
  end

  def is_fizz?
    self.check(@@divisor)
  end
end
