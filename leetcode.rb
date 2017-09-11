# 125. Valid Palindrome

# Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
#
# For example,
# "A man, a plan, a canal: Panama" is a palindrome.
# "race a car" is not a palindrome.
#
# Note:
# Have you consider that the string might be empty? This is a good question to ask during an interview.
#
# For the purpose of this problem, we define empty string as valid palindrome.

# @param {String} s
# @return {Boolean}

def is_palindrome(s)
    return true if s.length == 0
    alphabet = ("a".."z")
    numbers = ("0".."9")
    input = s.downcase.chars
    letters = []
    input.each do |el|
        if alphabet.include?(el) || numbers.include?(el)
            letters.push(el)
        end
    end
    return true if letters == letters.reverse
    return false
end



# 234. Palindrome Linked List
# NOTE: COULDN'T GET THIS

# Given a singly linked list, determine if it is a palindrome.
#
# Follow up:
# Could you do it in O(n) time and O(1) space?

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {Boolean}
def is_palindrome(head)
    return true if head == nil || head.next == nil
    node = head
    firstNode = head
    until node.next == nil
        node = node.next
    end
    lastNode = node
    until firstNode == lastNode || firstNode.val == nil || lastNode.val == nil
        if firstNode.val != lastNode.val
            return false
        else
            node = firstNode
            firstNode = firstNode.next
            until node.next == lastNode
                node = node.next
            end
            lastNode = node
        end
    end
    return true
end
