advice = "Few things in life are as important as house training your pet dinosaur."
shortened_advice = advice.slice!("Few things in life are as important as") # don't need a second variable because q only asking about a return value


advice.slice!(0, advice.index('house'))  # => "Few things in life are as important as "
p advice # => "house training your pet dinosaur."

advice.slice!(0, advice.index('as')) # this cuts off as - important to remember about this syntax (start, length)