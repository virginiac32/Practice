### Sorts

#### Questions

What are all the different sorts?
- Counting sort
Which sorts are stable?
- Stable: Insertion sort and quicksort
- Not stable: in place quicksort
Online sorts/algorithms - ones that can start computing as the inputs
come in, without having the full input at the beginning

#### Tries
Also called radix tree, digital tree, prefix tree. A search tree, an ordered
tree data structure used to store a dynamic set or associative array (key value pairs
where the keys show up at most once) are usually strings


#### Scoping

#### Closures
“A closure is a special kind of object that combines two things: a function, and the environment in which that function was created. The environment consists of any local variables that were in-scope at the time that the closure was created.”

#### Event Loop
https://developer.mozilla.org/en-US/docs/Web/JavaScript/EventLoop

Has a stack, queue, and heap
- Messages go into the queue, and a function is associated with each message
- When the stack has capacity, a message is removed from the queue and processed
  - Processing calls the function, which adds a frame to the stack


#### Binary to Decimal
Convert decimal to binary:
keep dividing by 2, and the remainder is the 1 or 0. The solution is the result going backwards:
Convert 13 to binary:
Division
by 2	Quotient	Remainder	Bit #
13/2	6	1	0
6/2	3	0	1
3/2	1	1	2
1/2	0	1	3
So 13 = 1101

Convert binary to decimal:
Start from the right and for each digit, multiply that by an increasing power of two (start with 2^0 = 1). Then add them all up.
Find the decimal value of 111001:
binary number:	1	1	1	0	0	1
power of 2:	25	24	23	22	21	2^0
= 57
