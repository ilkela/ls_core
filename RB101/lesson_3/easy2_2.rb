munsters_description = "The Munsters are creepy in a good way."
# my solution
puts md_1 = munsters_description.swapcase
#"tHE mUNSTERS ARE CREEPY IN A GOOD WAY." #swapcase
puts md_2 = munsters_description.gsub("Munsters", "munsters")
#"The munsters are creepy in a good way." # only m therefore iterate and change m to downcase
puts md_3 = md_2.gsub("The", "the")
#"the munsters are creepy in a good way." # starts_with?(t), downcase.
puts md_4 = md_2.upcase
#"THE MUNSTERS ARE CREEPY IN A GOOD WAY." #upcase

# LS solution
puts munsters_description.swapcase! #switches what is downcase with upcase
puts munsters_description.capitalize! #only capitalizes first word in sentence - I didn't realise that and that is why I did not think to use it
puts munsters_description.downcase! #downcases everything
puts munsters_description.upcase! #upcases everything
