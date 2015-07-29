require "../src/attr_accessor"
require "../src/delegator"
require "../src/function_owner"

class TestClass
  extend AttrAccessor
  extend Delegator
  my_attr_accessor :attr1

  function_owner = FunctionOwner.new

  delegate :say_hi, to: function_owner
end

test = TestClass.new
puts test.methods
test.say_hi
