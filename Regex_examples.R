# Regex examples

library(stringr)

sentence <- "This is the first line of 2.\nThis is the second"
phrase <- c("hello", "darkness", "my old", "friend.","The", "end.")

str_view(sentence, "e")
str_view(sentence, "[aeiou]")
str_view(sentence, "[e-l]")

str_view(phrase, "[d]$")
str_view(phrase, "\\.")
str_view(phrase, ".")
str_view(phrase, "[.]")

str_view(sentence, "\\d")
str_view(sentence, "\\W")


# Identify valid emails
emails <- c("john.doe@uni.edu", "jane.doe@someplace.ca", "invalid.ca", 
            "_@notvalid", "notvalid@fake", "big.bird@sesame.tv", "notused@",
            "@notvalid.ca", "fake@fake.fakest0", "fake@some.p","fake@fake.f0akest")

# Has an @ sign
str_view(emails, "@")
# Has account before @
str_view(emails, ".+@")
# Account name starts with alphanumeric character
str_view(emails, "[A-Za-z0-9]+@")
# Check after @ sign 
str_view(emails, "[A-Za-z0-9]+@[A-Za-z0-9]+")
# Domain name and period after @ 
str_view(emails, "[A-Za-z0-9]+@[A-Za-z0-9]+\\.")
# Has to have valid domain extension (lowercase 2 to 4 chars )
str_view(emails, "[A-Za-z0-9]+@[A-Za-z0-9]+\\.[a-z]{2,4}")
# Has nothing after the above
str_view(emails, "[A-Za-z0-9]+@[A-Za-z0-9]+\\.[a-z]{2,4}\\z")

