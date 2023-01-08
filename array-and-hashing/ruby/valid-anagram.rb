# @param {String} s
# @param {String} t
# @return {Boolean}
def anagram?(string1, string2)
  string1.chars.sort == string2.chars.sort
end
