class LinkedList   #?'s line 29
  attr_reader :size #creates getter for @size
  attr_accessor :payload

  def initialize(*payloads) #*args is not passed in until test 16  the star allows you to add an entire array into to payload
    @size = 0 #sets size to 0
    payloads.each{|payload| add_item(payload)} # this takes the seed argument and iterates over it if it's an array passing it one item at a time into add_item method
    @array = []
  end

  def add_item(payload) #defines method add_item which will add an item to the link list by passing a payload in to the new items
    lli = LinkedListItem.new(payload) #creates new item with payload; passes it to the variable lli; this is whatever new item is passed in from the tests
    if @first_item.nil? #if there is nothing in @first/item instance variable
      @first_item = lli  #then the new item created above with payload is passed lli
    else
      item = @first_item #if there is something in @first_item it is passed to the variable item
      until item.last? #iterates until item is recognized as the last item by the last? method created on the last page
        item = item.next_list_item  # iteration passes each item into method next_list_item until there are no more items
      end
      item.next_list_item = lli #makes the next list item the item created in line 10 in response to if statement on line11
    end
    @size += 1 #increments the @size instance variable by 1 each time an item is passed through
  end


  def get(i) # this is a getter function for getting the index of the Linked_list
    get_item(i).payload #returns item.payload if what
  end

  alias [] get # when you see brackets use the get function

    def []=(index, value) #defining the [] setter
      item = @first_item # sets the variable item to @first_item
      index.times do #iterates as many times as index is fed in
         item= item.next_list_item #feeds item to @next_list_item
        #  puts "(((((((()))))))))))))((((((((((((((@item))))))))))))))"
        #  puts @first_item.payload
        #  puts"((((((((((((((item.next_list_Item)))))))))))))"
        puts item.payload
      end

      item.payload = value #returns item.payload in the variable value
      # puts '((((((((((((((((((((value))))))))))))))))))))'
      # puts value
    end

  def last #defines last object finds the last by counting back from size which will be at the count of the objects, then stop when you get to zero and returns nil
    if size == 0 #if self.size (size getter created in by attr_reader in the top) seems to me that size @size and self.size are the same thing
      nil #return nill
    else
      get(size - 1) #passes size -1 into get method as i or index
    end
  end

  def to_s
    result = "|" #sets the right side of the string expected
    item = @first_item # passes @first_item instance variable to variable item
    until item.nil? #iterates until item is nil
      result << " " + item.payload.to_s #adds a space between the left vertical pipe and item.payload to string
      result << "," unless item.last? #adds a comma after item.payload in our string we're making... unless it is the last item
      item = item.next_list_item #resets the item variable to the return of item.next_list_item feeding it to the @next_list_item instance variable
    end
    result + " |" # adds a vertical pipe to the end of our string
  end
  #
  # def [](index) #defining the [] getter
  #   get(index)
  # end


  def remove(index)
    @size -= 1
    if index == 0
      @first_item = @first_item.next_list_item
    else
    previous_item = get_item( index -1)
    next_list_item = previous_item.next_list_item.next_list_item
    previous_item.next_list_item = next_list_item
    #get_item( index - 1).next_list_item = nil
    # return @first_item = @first_item.next_list_item if index == 0
    # item = @first_item
    # (index - 1).times do
    #   item = item.next_list_item
    # #   puts "(((((((()))))))))))))((((((((((((((@item))))))))))))))"
    # #   puts @first_item.payload
    # #   puts"((((((((((((((item.next_list_Item)))))))))))))"
    # #  puts item.payload
    # end
    # raise IndexError if item.nil?
    # item.next_list_item = item.next_list_item.next_list_item
  end
end

  def indexOf(payload)
    item = @first_item
    index = 0
    until item.nil?
      return index if item.payload == payload
      index += 1
      item = item.next_list_item

    # return nil if item.nil?
    # until item.payload == payload
    #   return nil if item.last?
    #   item = item.next_list_item
    #   index += 1
    # # puts "(((((((((((((((((((payload)))))))))))))))))))"
    # # puts @first_item.payload
    end
    nil
  end

  def sorted?
    item = @first_item
    until item.nil? or item.last?
      return false if item > item.next_list_item
      # item <= item.next_list_item
      item = item.next_list_item
    end
    true
  end

  def sort
    (1...@size).each do |i|
      item = @first_item
      return self if item.nil?
      value_to_insert = get(i)

      value_to_compare = item.payload
      index = indexOf(item.payload)
      insertion_index = i
      # puts insertion_index
    while insertion_index > 0 && value_to_insert < item.payload
      @array.push( value_to_insert, value_to_compare)#, value_to_insert)
      sorted = @array
      return sorted.to_s
        # return "| " + value_to_insert+", " + item.payload+ " |"
        index -=1
        # item = item.next_list_item
    end
      item = item.next_list_item
  end
  self
end
# if item > item.next_list_item

# if value to insert > item
#   value
# index += 1
# puts @first_item
# breaks code: value_to_insert.next_list_item
  #     if item > item.next_list_item
  #       swap(item)
  #       sort
  #     else
  #       item = item.next_list_item
  #     end
  #   end
  #   self
  # end
#     index = 0
#     # item = nil
#     if index === 0
#       item = self
#       else
#       item = @first_item
#       index += 1
#     # item = item.next_list_item
#     puts "(((((((((())))))))))"
#     puts index
#     puts item
#     until item.nil? or item.last?
#       return false if item > item.next_list_item
#       item = item.next_list_item
#   if index === 0
#     item = self
#   until item.nil? or item.last?
#     # until
#   # elsif index < 1
#     # sorted = index
#     # item
#     end
#   end
# end
    # item.each{|i| }
    # payloads.each{|payload| add_item(payload)} # this takes the seed argument and iterates over it if it's an array passing it one item at a time into add_item method


#     while index > 0
#     puts "(((((((((((((((())))))))))))))))"
#     index
#     return item
#     until item.nil? or item.last?
#     item = item.next_list_item
#     index += 1
#     puts "(((((((((((((((())))))))))))))))"
#     puts item, index
# end


    #
    # item = @first_item

    # return index.to_string
    # return item.to_s
    # until item.nil? or item.last?

      # sorted = @
      # while
  #   end
# end/


    # (1..list.length -1).each do |i|
    #   value = list[i]
    #   j = i - 1
    #   while j >= 0 && list [j] > value do
    #     list[j+1] = value
    #     j -= 1
    #   end
    #   list[j + 1] = value
    # end
    # list
  # end


  private
  def get_item(i)
    raise IndexError if i < 0 or i >= size #raises Index error if
    item = @first_item #passes @first item instance into the variable item
    i.times do #says as many times as there is an i passed
      item = item.next_list_item #pass the item to next_list_item
    end
    item
  end

end
