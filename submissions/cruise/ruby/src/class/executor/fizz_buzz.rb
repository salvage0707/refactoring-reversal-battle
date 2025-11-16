# frozen_string_literal: true

class FizzBuzz < Executor
  # pp 75 「Rubyでクラス変数は使うべきでない機能のひとつ」

  @@diviseur = 'fizzbuzzfizzbuz'.length # フランス語「割られる数」

  def initialize(dividende)
    @target_number = dividende # フランス語「割る数」
  end

  def is_fizzbuzz?
    self.check(@@diviseur)
  end
end
