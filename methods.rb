def calculate_age(dob)
 today = Date.today
 out = case
 when dob > today
   "That date is in the future, so not much use for calculating age from..."
 else
   age = today.year - dob.year - ((today.month > dob.month || (today.month == dob.month && today.day >= dob.day)) ? 0 : 1)

   case age
   when 0
     "Not even one-year-old yet"
   when 1..99
     "If that was your birthday, you would be #{age} year#{'s' if age > 1} old now."
   else
     "If that was your birthday, you would be #{age} years old now. And looking pretty good on it!"
   end
 end
end

def calculate_xmas
  today = Date.today

  # Uncomment for testing purposes to get a fake 'today'
  # today = (Date.new(today.year, 1, 1).. Date.new(today.year, 12, 31)).to_a.sample

  christmas = Date.new(today.year, 12, 25)
  sleeps = (christmas - today).to_i

  output = case sleeps.to_i
  when 0
    "OMG! Check your stockings! Santa's been!!"
  when 1..10
    "Only #{sleeps} sleep#{'s' unless sleeps == 1} to go. It's getting close!"
  when 11..24
    "The advent calendar is getting a workout with only #{sleeps} sleeps to go."
  when 25..54
    "#{sleeps} sleeps until Christmas. Better get the cards for Australian friends written."
  when 55..100
    "#{sleeps} sleeps. Check back soon."
  when 101..250
    "You're too keen. I feel almost mean telling you there's #{sleeps} sleeps still left."
  when 251..366
    "It's hardly even Easter! There still #{sleeps} sleeps until Christmas."
  else
    "Oh noes! You missed it! Gotta wait until next year now :-("
  end
end

def calculate_nums(num1, num2, operator)
  output  = case operator
  when '+'
    num1+ num2
  when '-'
    num1- num2
  when '*'
    num1* num2
  when '/'
    num1/ num2
  when '**'
    num1 ** num2
  when 'sqrt'
    Math.sqrt(num1)
  end
  output
end

def unit_converter(number, unit)
  result = number * case unit
  when 'm'
    1.6093
  when 'f'
    0.3048
  when 'i'
    2.54
  when 'k'
    0.6214
  when 'e'
    3.2808
  when 'c'
    0.3937
  end
  result
end

def calculate_volume(number, shape)
  output = case shape
  when 'c'
    number ** 3
  when 's'
    (4.0 / 3.0) * Math::PI * (number ** 3)
  end
end

def calculate_manliness(car)
output = case car
  when "fiat"
    "average"
  when "ford"
    "ok"
  when "bmw"
    "minscule"
  when "mercedes"
    "small"
  when "lamborghini"
    "non-existant"
  end
end