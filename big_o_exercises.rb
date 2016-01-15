list = (1..100).to_a.shuffle



def my_min(list)
  i = 0
  while i < list.length

    return list[i] if list.all?{|element| element >= list[i] }
    i += 1
  end
end


def my_min2(list)
  best = nil
  list.each do |num|
    if best == nil || num < best
      best = num
    end
  end
  best
end



array = [5,3,-7]

def sub_sum(array)
  out_array = []
  best = nil

  i = 0
  while i < array.length

    j = i
    while j < array.length
      out_array << array[i..j]
      j += 1
    end

    i += 1
  end

  out_array.map {|sub_arr| sub_arr.inject(:+)}.max
end


def sub_sum2(array)
  max_sum = nil
  current_sum = 0

  i = 0
  while i < array.length
    current_sum += array[i]

    if max_sum == nil || (array[i+1] < 0 && current_sum > max_sum)
      max_sum = current_sum
      current_sum = 0
      i += 2
    else
      i += 1
    end
  end

  max_sum
end


p sub_sum2(array)


array = [3,1,5,-6,3,7,-2]


def max_subarray(array)
    max_ending_here = 0
    max_so_far = 0

    array.each do |el|

      max_ending_here = [0, (max_ending_here + el)].max
      max_so_far = [max_so_far, max_ending_here].max

    end

  return max_so_far
end

p max_subarray(array)
#
# class Array
#   def subsets
#     return [[]] if empty?
#     subs = take(count - 1).subsets
#     subs.concat(subs.map { |sub| sub + [last] })
#   end
# end
#
#
# require 'benchmark'
#
# Benchmark.bm do |bm|
#   bm.report ("bad_min: ") do
#     my_min(list)
#   end
#   bm.report ("better_min ") do
#     my_min2(list)
#   end
#
# end
#
# puts "done!"
