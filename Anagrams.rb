def anagram1(str1, str2)
  combination_str1 = str1.split("").permutation(str1.length).map{|arr| arr.join("")}
  combination_str1.include?(str2)
end


def anagram2(str1, str2)
  i = 0

  while i < str2.length
    if str1[0] == str2[i]
      str1.slice!(0)
      str2.slice!(i)
      i = 0
    else
      i += 1
    end
  end
  str1.empty? && str2.empty?
end

def anagram3(str1, str2)
  str1.split("").sort == str2.split("").sort
end

def anagram4(str1, str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  str1.each_char do |char|
    hash1[char] += 1
  end

  str2.each_char do |char|
    hash2[char] += 1
  end

  hash1 == hash2
end

def anagram5(str1, str2)
  hash1 = Hash.new(0)

  str1.each_char do |char|
    hash1[char] += 1
  end

  str2.each_char do |char|
    return false unless hash1.keys.include?(char)
    return false unless hash1[char] == str2.count(char)
  end

  true
end



 str1= "gizmo"
 str2="sally"



 require 'benchmark'

 Benchmark.bm do |bm|
   bm.report ("anagram1: ") do
     anagram1(str1,str2)
   end
   bm.report ("anagram2: ") do
     anagram2(str1,str2)
   end
   bm.report ("anagram3: ") do
     anagram3(str1,str2)
   end
   bm.report ("anagram4: ") do
     anagram4(str1,str2)
   end
   bm.report ("anagram5: ") do
     anagram5(str1,str2)
   end

 end

 #note: WHAT IS HAPPENING why is 5 so fast 
