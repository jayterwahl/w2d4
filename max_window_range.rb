require_relative 'stacks_and_queues.rb'

def max_window_range1(arr, w)
  i = 0
  max_range = nil

  while (i + w - 1) < arr.length
    current_range = arr[i..(i+w-1)].max - arr[i..(i+w-1)].min

    if max_range == nil || max_range <  current_range
      max_range = current_range
    end

    i += 1
  end

  max_range
end
#
# p max_window_range1([5, 4, 8], 2) == 4 # 4, 8
# p max_window_range1([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p max_window_range1([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p max_window_range1([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

def optimized(arr, w)
  sq = MinMaxStackQueue.new
  max_range = nil
  i = 0

  indexes = (i..(i+w-1)).to_a

  indexes.each do |index|
    sq.enqueue(arr[index])
  end

  while (i + w - 1) < arr.length
    current_range = sq.max - sq.min

    if max_range == nil || max_range <  current_range
      max_range = current_range
    end

    sq.dequeue
    i += 1
    sq.enqueue(arr[i+w-1]) unless arr[i+w-1] == nil

  end

  max_range

end


def the_optimal(arr, w)
  sq = MinMaxStackQueue.new
  max_range = nil
  i = 0

  while i < arr.length
    if sq.size < w
      sq.enqueue(arr[i])
    elsif sq.size == w
      sq.dequeue
      sq.enqueue(arr[i])

      if max_range == nil || max_range <  sq.max - sq.min
        max_range = sq.max - sq.min
      end

    end
      i += 1
  end

  max_range
end

p the_optimal([5, 4, 8], 2) == 4 # 4, 8
p the_optimal([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p the_optimal([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p the_optimal([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8


arr = [1, 3, 2, 5, 4, 8, 1, 0, 2, 5, 4, 8, 1, 3, 2, 5, 4, 8]
target =  5


require 'benchmark'

Benchmark.bm do |bm|
  bm.report ("max_window_range1: ") do
    max_window_range1(arr,target)
  end
  bm.report ("OPTIMAL SOLUTION: ") do
    optimized(arr,target)
  end
  bm.report ("THE OPTIMAL: ") do
    the_optimal(arr,target)
  end
end
#



# p optimized([5, 4, 8], 2) == 4 # 4, 8
# p optimized([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p optimized([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p optimized([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
