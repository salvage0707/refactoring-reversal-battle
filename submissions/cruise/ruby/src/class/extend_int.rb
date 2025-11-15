# frozen_string_literal: true

require 'bigdecimal'

# pp26 「独自クラスを定義する前に、何よりもまず考えるべきことは「本当に独自クラスを定義する必要があるのだろうか？」です」
class ExtendInt

  def initialize(value)
    @value = value
  end

  def to_big_decimal
    BigDecimal(@value)
  end
end
