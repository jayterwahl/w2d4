class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store << el
  end

  def dequeue
    @store.shift
  end

  def peek
    @store[0]
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class MyStack
  def initialize
    @plates = []
    @max_array = []
    @min_array = []
  end

  def pop
    deleted = @plates.pop

    if @max_array[-1] == deleted
      @max_array.pop
    end

    if @min_array[-1] == deleted
      @min_array.pop
    end

    deleted
  end

  def max
    @max_array[-1]
  end

  def min
    @min_array[-1]
  end

  def push(el)
    @plates << el

    if @max_array == [] || el >= @max_array[-1]
      @max_array << el
    end

     if @min_array == [] || el <= @min_array[-1]
       @min_array << el
     end
  end

  def size
    @plates.length
  end

  def empty?
    @plates.empty?
  end

  def [](index)
    @plates[index]
  end
end




class StackQueue

  def initialize
    @ordered = MyStack.new
    @backwards = MyStack.new
  end

  def enqueue(num)
    @ordered.push(num)
  end

  def dequeue
    until @ordered.size == 1
      @backwards.push(@ordered.pop)
    end
    value = @ordered.pop
    until @backwards.empty?
      @ordered.push(@backwards.pop)
    end
    value
  end

  def size
    @ordered.size
  end

  def empty?
    @ordered.empty?
  end

end


class MinMaxStackQueue

  def initialize
    @ordered = MyStack.new
    @backwards = MyStack.new
  end

  def enqueue(num)
    @ordered.push(num)
  end

  def dequeue
    until @ordered.size == 1
      @backwards.push(@ordered.pop)
    end
    value = @ordered.pop
    until @backwards.empty?
      @ordered.push(@backwards.pop)
    end
    value
  end

  def size
    @ordered.size
  end

  def empty?
    @ordered.empty?
  end

  def max
    @ordered.max
  end

  def min
    @ordered.min
  end

end


stack1 = MinMaxStackQueue.new
stack1.enqueue(5)
stack1.enqueue(4)
stack1.enqueue(3)
stack1.enqueue(7)
stack1.enqueue(9)
stack1.enqueue(3)
stack1.enqueue(2)
stack1.enqueue(9)
stack1.dequeue
stack1.dequeue
stack1.dequeue
# p stack1.max
# p stack1.min


#
# sq = StackQueue.new
#
# sq.enqueue(3)
# sq.enqueue(2)
# sq.enqueue(1)
# p sq.dequeue
# p sq
