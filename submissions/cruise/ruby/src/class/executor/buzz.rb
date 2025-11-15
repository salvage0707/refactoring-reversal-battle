# frozen_string_literal: true

class Buzz < Executor
  # pp 75 「Rubyでクラス変数は使うべきでない機能のひとつ」

  @@divisor = 'buzzz'.length # ドイツ語「割られる数」

  def initialize(dividend)
    @target_number = dividend # ドイツ語「割る数」
  end

  def is_buzz?
    self.check(@@divisor)
  end
end
