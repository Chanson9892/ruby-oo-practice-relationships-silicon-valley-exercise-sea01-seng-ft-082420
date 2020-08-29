require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
a1 = Startup.new("apple", "Tim", 'apple.com')
a2 = Startup.new("banana", "Joe", 'banana.com')
a3 = Startup.new("veggie", "Larry", 'veggie.com')


b1 = VentureCapitalist.new("Bruce", 2000000000)
b2 = VentureCapitalist.new("Tony", 2000000005)
b3 = VentureCapitalist.new("Oliver", 999999999)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line