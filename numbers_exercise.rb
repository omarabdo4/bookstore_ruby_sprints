number = 1

binNum = Integer(number.to_s,2)

p binNum

evenOrOdd = "odd" if number.odd?
evenOrOdd = "even" if number.even?

p evenOrOdd

subtracted2 = number - 2

p subtracted2

devidedby2 = subtracted2.to_f
devidedby2 = devidedby2/2

p devidedby2

quarter = Rational(1)/4

rationalNum = quarter

addedRational = Rational(devidedby2 + rationalNum)

p addedRational

p addedRational.numerator
p addedRational.denominator

third = Rational(1)/3

multipliedByThird = third * addedRational

p multipliedByThird

roundedTo3 = multipliedByThird.to_f.round(3)

p roundedTo3

y = roundedTo3.to_s

p y

intY = y.to_i

p intY

decY = y.to_i(base=10)

p decY