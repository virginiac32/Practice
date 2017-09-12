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
Add Comment Collapse



2 new messages since 9:52 AM
Mark as read (esc)

Message @Chris Comings

*bold* _italics_ ~strike~ `code` ```preformatted``` >quote
Thread
Ade Farquhar, Tianyu Duan, and 2 others
Jonathan Chaney and David Corson-Knowles
