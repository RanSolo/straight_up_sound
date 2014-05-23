class LinkedListItem
  include Comparable
  attr_accessor :payload
  attr_reader :next_list_item

  def initialize(payload)
    @payload = payload #takes the payload sent in and passes it to instance variable @payload
    # @next_list_item = nil
  end

  def <=>(other) #defining comparablility between self objects and other objects
    payload1 = self.payload  #creates payload1 and passes self.payload to it
    payload2 = other.payload #creates payload2 and passes other.payload to it

    precedence = [Fixnum, String, Symbol]  #Fixnum is greeater than String is greater than Symbol by the rules of ruby
    index1 = precedence.index(payload1.class)  #finds out how payload1.class fits into the precedence order... Fixnum, String, or Symbol
    index2 = precedence.index(payload2.class) #finds outhow payload2.class fits into the precedence order
    class_equality = (index1 <=> index2) # passes a comparason of index1 into index2 in to the variable class_equality

    if class_equality == 0
      payload1 <=> payload2 #compare payload1 and payload2 if class equality returns 0 because
    else
      class_equality
    end
  end

  def ===(other)
    self.object_id == other.object_id
  end

  def next_list_item=(item)
    raise ArgumentError if self === item
    @next_list_item = item
  end

  def last?
    @next_list_item.nil?
  end
end
