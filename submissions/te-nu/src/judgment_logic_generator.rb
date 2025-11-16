class JudgmentLogicGenerator
  def fizz(n)
    proc do
      n % 3 == 0
    end
  end

  def buzz(n)
    proc do
      `if [ $((#{n} % 5)) = 0 ]; then echo true; else echo false; fi`.chomp == 'true'
    end
  end

  def fizz_buzz(n)
    proc do
      `if [ $((#{n} % 15)) = 0 ]; then echo true; else echo false; fi`.chomp == 'true'
    end
  end
end
