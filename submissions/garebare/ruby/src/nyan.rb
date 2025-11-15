def main(n)
  return fizz_buzz_strings() if is_fizz_buzz(n)
  return fizz_strings() if is_fizz(n)
  return buzz_strings() if is_buzz(n)
  return n.to_s
end
def fizz_strings()
  result_unicode = []
  (1..4).map do |n|
    if (n == 1) then result_unicode << "\u0046" end
    if (n == 2) then result_unicode << "\u0069" end
    if (n == 3) then result_unicode << "\u007A" end
    if (n == 4) then result_unicode << "\u007A" end
  end

  result_strings = []
  result_unicode.map do |unicode|
    result_strings << unicode.encode('UTF-8').to_s
  end

  return result_strings.join("")
end

def is_fizz(n)
  return true if (n % '3'.to_i).zero?
  false
end
def buzz_strings()
  result_unicode = []
  (1..4).map do |n|
    if (n == 1) then result_unicode << "\u0042" end
    if (n == 2) then result_unicode << "\u0075" end
    if (n == 3) then result_unicode << "\u007A" end
    if (n == 4) then result_unicode << "\u007A" end
  end

  result_strings = []
  result_unicode.map do |unicode|
    result_strings << unicode.encode('UTF-8').to_s
  end

  return result_strings.join("")
end

def is_buzz(n)
  return true if (n % '5'.to_i).zero?
  false
end
def is_fizz_buzz(n)
  return true if (n % '15'.to_i).zero?
  false
end

def fizz_buzz_strings()
  result_unicode = []
  (1..8).map do |n|
    if (n == 1) then result_unicode << "\u0046" end
    if (n == 2) then result_unicode << "\u0069" end
    if (n == 3) then result_unicode << "\u007A" end
    if (n == 4) then result_unicode << "\u007A" end
    if (n == 5) then result_unicode << "\u0042" end
    if (n == 6) then result_unicode << "\u0075" end
    if (n == 7) then result_unicode << "\u007A" end
    if (n == 8) then result_unicode << "\u007A" end
  end

  result_strings = []
  result_unicode.map do |unicode|
    result_strings << unicode.encode('UTF-8').to_s
  end

  return result_strings.join("")
end
puts(main(100))
