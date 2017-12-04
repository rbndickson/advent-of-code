# a valid passphrase must contain no duplicate words.
# How many passphrases are valid?

def all_unique?(passphrase)
  words = passphrase.split
  words.uniq == words
end

def valid_passphrase_count(passphrases)
  passphrases.split("\n").count do |passphrase|
    yield(passphrase)
  end
end

p valid_passphrase_count('aa bb cc dd ee
aa bb cc dd aa
aa bb cc dd aaa') { |passphrase| all_unique?(passphrase) }

# Part 2

# Now, a valid passphrase must contain no two words that are anagrams of
# each other

def valid_all_unique_no_anagrams?(passphrase)
  words = passphrase.split.map { |word| word.chars.sort.join }
  words.uniq == words
end

p valid_passphrase_count('abcde fghij
abcde xyz ecdab
aa bb cc dd aaa
a ab abc abd abf abj
iiii oiii ooii oooi oooo
oiii ioii iioi iiio') { |passphrase| valid_all_unique_no_anagrams?(passphrase) }
