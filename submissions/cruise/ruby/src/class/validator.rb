# frozen_string_literal: true

class Validator
  attr_reader :target_number

  def initialize(target_number)
    @target_number = target_number
  end

  def valid?(n)
    raise ArgumentError, "nはnilであってはなりません" unless !n.nil?
    raise ArgumentError, "nは数値である必要があります" unless n.is_a?(Numeric)
    raise ArgumentError, "nは1以上の整数である必要があります" unless n > 0
    raise ArgumentError, "nは整数である必要があります" unless n.integer?
  end
end
