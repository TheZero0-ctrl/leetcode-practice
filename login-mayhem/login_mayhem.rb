# This theoretical Social network has major security flaw
# It allows anyone to login as any user as long as password matches the
# sub string of correct password
# for example if the correct password id 'dish' then password likes:
# brandish and radishes would work
# Our program need to support two type of operatins
# Add => Sign up new user with the given password
# Query => Given the password return the number of user's password that
# could be used to login
# Input will be:
# A line containing q, number of queries to be performed
# add operations will be given as
# 1 <password>
# This operation will not need any output
# query operations will be given as
# 2 <password>
# Output will be
# The number of users that could be used to login

def add_user_password(password, user_passwords)
  # Add all possible substrings of the password to the hashmap
  substrings = []
  (0..password.length - 1).each do |i|
    (i..password.length - 1).each do |j|
      substring = password[i..j]
      next if substrings.include?(substring)

      user_passwords[password[i..j]] ||= 0
      user_passwords[password[i..j]] += 1
      substrings << substring
    end
  end
end

def query_user_password(password, user_passwords)
  # Check if the given password is a substring of any existing password
  user_passwords[password] || 0
end

def main
  q = gets.chomp.to_i
  user_passwords = {}

  q.times do
    operation, password = gets.chomp.split(' ')
    if operation == '1'
      add_user_password(password, user_passwords)
    elsif operation == '2'
      puts query_user_password(password, user_passwords)
    end
  end
end

main
