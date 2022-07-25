flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
hash = flintstones.slice("Barney")
array = hash.flatten
 #or
flintstones.assoc("Barney")

