sentence = "The Flintstones Rock!"

10.times { |x| puts sentence.insert(0, ' ') }

10.times { |x| puts sentence.prepend(' ') }

# LS solution
10.times { |number| puts (" " * number) + "The Flintstones Rock!" }

# my solution gives a slightly different ouput - the first iteration already includes a space, in LS version, not. but I don't understand why that  is?
# also in my solutions the caller is being mutated - and that is apparently a big no-no. In LS version there is no caller.