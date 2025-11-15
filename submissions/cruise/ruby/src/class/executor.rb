# frozen_string_literal: true

require 'bigdecimal'

class Executor
  
  def initialize(割られる数)
    @target_number = 割られる数
  end

  # def to_big_decimal
  #   BigDecimal(self.target_number)
  # end

  def check(割る数)
    big_decimal_target_number = ExtendInt.new(@target_number).to_big_decimal
    big_decimal_target_waru_kazu = ExtendInt.new(割る数).to_big_decimal
    (big_decimal_target_number % big_decimal_target_waru_kazu).zero?
  end
end
