class TrueClass
  def 真?
    'はい' if true?
  end

  def 偽?
    'いいえ' if false?
  end

  def true?
    self == true
  end

  def false?
    self == false
  end

  def not_true?
    !true?
  end

  def not_false?
    !false?
  end
end
