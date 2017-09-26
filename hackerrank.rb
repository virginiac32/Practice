# Strange Counter
# https://www.hackerrank.com/challenges/strange-code/problem

# passed all but the last test case

#!/bin/ruby

t = gets.strip.to_i

def strangeCode(t)
    thisT = t
    max = 3
    while thisT >= max
        thisT = thisT-max
        max = max*2
    end
    return max-thisT+1
end

puts strangeCode(t)


# Enter your code here. Read input from STDIN. Print output to STDOUT

n = gets.strip.to_i
arr = []
STDIN.read.split("\n").each do |a|
   arr.push(a)
end
arr = arr.map do|el|
    el.split(" ")
end
arr.each do |el|
    el[0]=el[0].to_i
end

# The Full Counting Sort
# https://www.hackerrank.com/challenges/countingsort4/problem
# Was not able to output stabley

def countingSort4(n,arr)
    counter = []
    arr.each do |el|
        if counter[el[0]] == nil
            counter[el[0]] =1
        else
            counter[el[0]] +=1
        end
    end
    (1...counter.length).each do |idx|
        counter[idx] = counter[idx]+counter[idx-1]
    end
    output = []

    arr.each_with_index do |el,idx|
        position = counter[el[0]]
        if idx <= (arr.length-1)/2
            output[position] = '-'
        else
            output[position] = el[1]
        end
        counter[el[0]] -= 1
    end
    return output.join(' ')
end

print countingSort4(n,arr)


# Simple Text Edit
# Timed out - was too slow!

n = gets.strip.to_i
arr = []
STDIN.read.split("\n").each do |a|
    arr.push(a)
end

arr = arr.map do |el|
        el.split(" ")
end

arr.each do |el|
    el[0] = el[0].to_i
    if el[1] && ("0".."9").include?(el[1])
        el[1] = el[1].to_i
    end
end

class Editor
    def initialize
        @S
        @lastStates = []
    end

    def actions(arr)
        arr.each do |el|
            case el[0]
                when 1
                    append(el[1])
                when 2
                    delete(el[1])
                when 3
                    print(el[1])
                when 4
                    undo
            end
        end
    end


    def append(w)
        @lastStates.push(@S)
        if @S
            @S = @S + w
        else
            @S = w
        end
    end


    def delete(k)
        indexToDelete = @S.length - k
        @lastStates.push(@S)
        @S = @S.slice(0,indexToDelete)
    end

    def print(k)
        puts @S[k-1]
    end

    def undo()
        @S = @lastStates.pop
    end

end

editor = Editor.new
editor.actions(arr)
