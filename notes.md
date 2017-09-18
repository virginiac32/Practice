#### Questions

What are all the different sorts?
- Counting sort
Which sorts are stable?
- Stable: Insertion sort and quicksort
- Not stable: in place quicksort
Online sorts/algorithms - ones that can start computing as the inputs
come in, without having the full input at the beginning


#### Scoping

#### Closures
“A closure is a special kind of object that combines two things: a function, and the environment in which that function was created. The environment consists of any local variables that were in-scope at the time that the closure was created.”

#### Event Loop
https://developer.mozilla.org/en-US/docs/Web/JavaScript/EventLoop

Has a stack, queue, and heap
- Messages go into the queue, and a function is associated with each message
- When the stack has capacity, a message is removed from the queue and processed
  - Processing calls the function, which adds a frame to the stack
