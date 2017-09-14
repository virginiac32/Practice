# From Chris C. Find the number of possible combinations of songs in a playlist with n songs,
# k songs before a song can be repeated, and l # songs in a playlist

def numOfPlaylist(n, k, l)
  num = 1
  l.times do |i|
    num *= n - [k, i].min
  end
  num
end
#
p numOfPlaylist(1, 0, 3)
p numOfPlaylist(1, 1, 3)

def factorial(n)
  n.downto(1).inject(:*)
end

def num_of_playlist2(n, k, l)
  (
    factorial(n) / factorial(n - k)
  ) * (
    (n - k)**(l - k)
  )
end


# Fibonnaci sequence with 3 (1,1,1,3,5...). Use O(n) time and O(1) space

def fib3(n)
  fibNums = {1=>1, 2=>1, 3=>1}
  return fibNums[n] if n < 4
  (4..n).each do |i|
    fibNums[i] = fibNums[i-1]+fibNums[i-2]+fibNums[i-3]
    fibNums.delete(i-3)
  end
  return fibNums[n]
end
