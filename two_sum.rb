def bad_two_sum?(arr, target)

  i = 0
  while i < arr.length
    j = 1 + i
    while j < arr.length
      return true if arr[i] + arr[j] == target
      j += 1
    end
    i += 1
  end
  false
end

#
# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

#note: b_search here?

def okay_two_sum?(arr,target)
  arr = arr.sort

  i = 0
  j = arr.length-1

  until i >= j
    current_sum = arr[i] + arr[j]
    if current_sum > target
      j -= 1
    elsif current_sum == target
      return true
    else
      i += 1
    end
  end

  false
end

arr = (1..5000).to_a

target = 9999


#why so slow?
def hash_map(arr, target)
  our_hash = Hash.new(0)
  arr.each do |el|
    our_hash[el] += 1
  end

  our_hash.each do |key, value|
    temp_key = key
    our_hash.delete(key)
    return true if our_hash.include?(target - temp_key)
  end
  false
end

# p hash_map(arr, 6) # => should be true
# p hash_map(arr, 10) # => should be false
