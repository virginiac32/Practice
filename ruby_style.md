## Ruby Style Guide Notes
Excerpted from: https://github.com/bbatsov/ruby-style-guide

- No spaces after (, [ or before ], ). Use spaces around { and before }
- Indent when as deep as case
```ruby
case
when song.name == 'Misty'
  puts 'Not again!'
when song.duration > 120
  puts 'Too long!'
when Time.now.hour > 21
  puts "It's too late"
else
  song.play
end
```
- When assigning the result of a conditional expression to a variable, preserve the usual alignment of its branches
```ruby
result = if some_cond
           calc_something
         else
           calc_something_else
         end
kind =
    case year
    when 1850..1889 then 'Blues'
    when 1890..1909 then 'Ragtime'
    when 1910..1929 then 'New Orleans Jazz'
    when 1930..1939 then 'Swing'
    when 1940..1950 then 'Bebop'
    else 'Jazz'
    end
```
- Align the parameters of a method call if they span more than one line. When aligning parameters is not appropriate due to line-length constraints, single indent for the lines after the first is also acceptable.
```ruby
def send_mail(source)
  Mailer.deliver(to: 'bob@example.com',
                 from: 'us@example.com',
                 subject: 'Important message',
                 body: source.text)
end```
or
```ruby
def send_mail(source)
  Mailer.deliver(
    to: 'bob@example.com',
    from: 'us@example.com',
    subject: 'Important message',
    body: source.text
  )
end
```
- Align the elements of array literals spanning multiple lines.
  - Bad:
```ruby
menu_item = ['Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam',
  'Baked beans', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam']
```
  - Good
  ```ruby
  menu_item = [
  'Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam',
  'Baked beans', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam'
]
menu_item =
  ['Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam',
   'Baked beans', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam']
  ```
- Add underscores to large numeric literals to improve their readability.
```ruby
num = 1_000_000
```
- Define optional arguments at the end of the list of arguments.
```ruby
def some_method(c, d, a = 1, b = 2)
  puts "#{a}, #{b}, #{c}, #{d}"
end
```
- Do not use for, unless you know exactly why. Most of the time iterators should be used instead. for is implemented in terms of each (so you're adding a level of indirection), but with a twist—for doesn't introduce a new scope (unlike each) and variables defined in its block will be visible outside it.
```ruby
arr.each { |elem| puts elem }
```
- Favor the ternary operator(?:) over if/then/else/end constructs.
- Leverage the fact that if and case are expressions which return a result.
```ruby
result =
    if condition
      x
    else
      y
    end
```
- Favor modifier while/until usage when you have a single-line body.
```ruby
do_something while some_condition
```
- Use Kernel#loop instead of while/until when you need an infinite loop.
```ruby
loop do
  do_something
end
```
- Use Kernel#loop with break rather than begin/end/until or begin/end/while for post-loop tests.
```ruby
loop do
  puts val
  val += 1
  break unless val < 0
end
```
- Use the proc invocation shorthand when the invoked method is the only operation of a block.
```ruby
names.map(&:upcase)
```
- Don't use the return value of = (an assignment) in conditional expressions unless the assignment is wrapped in parentheses.
```ruby
if (v = array.grep(/foo/))
  do_something(v)
end
v = array.grep(/foo/)
if v
  do_something(v)
end
```
- Use &&= to preprocess variables that may or may not exist. Using &&= will change the value only if it exists, removing the need to check its existence with if
  - bad:
  ```ruby
  if something
  something = something.downcase
end
  ```
  - best:
  ```ruby
  something &&= something.downcase
  ```
- Prefer proc over Proc.new
  - bad:
  ```ruby
  p = Proc.new { |n| puts n }
  ```
  - good:
  ```ruby
  p = proc { |n| puts n }
  ```
- Prefer proc.call() over proc[] or proc.() for both lambdas and procs
- Use $stdout/$stderr/$stdin instead of STDOUT/STDERR/STDIN. STDOUT/STDERR/STDIN are constants, and while you can actually reassign (possibly to redirect some stream) constants in Ruby, you'll get an interpreter warning if you do so.
- Use Array() instead of explicit Array check when dealing with a variable you want to treat as an Array, but you're not certain it's an array.
  - bad:
  ```ruby
  paths = [paths] unless paths.is_a? Array
paths.each { |path| do_something(path) }
  ```
  - good:
  ```ruby
  Array(paths).each { |path| do_something(path) }
  ```
- Use ranges.include? or Comparable#between? instead of complex comparison logic when possible.
- Avoid the use of BEGIN blocks.
- Prefer next in loops instead of conditional blocks.
  - bad:
  ```ruby
  [0, 1, 2, 3].each do |item|
      if item > 1
        puts item
      end
  end
  ```
  - good:
  ```ruby
  [0, 1, 2, 3].each do |item|
      next unless item > 1
      puts item
  end
  ```
- `flat_map` maps and flattens (flattens by 1 level)
- use `reverse_each` over `reverse.each`

#### Naming
- Use snake_case for symbols, methods and variables.
- Use CamelCase for classes and modules. (Keep acronyms like HTTP, RFC, XML uppercase.)
- Use snake_case for naming files and directories, e.g. hello_world.rb, lib/hello_world/hello_world.rb
- Aim to have just a single class/module per source file. Name the file name as the class/module, but replacing CamelCase with snake_case.
- Use SCREAMING_SNAKE_CASE for other constants.
- The names of predicate methods (methods that return a boolean value) should end in a question mark. (i.e. Array#empty?)
- Define the non-bang (safe) method in terms of the bang (dangerous) one if possible.
```ruby
def flatten_once
    dup.flatten_once!
  end
```

#### Comments
- Comment only when necessary
- Comments longer than a word are capitalized and use punctuation. Use one space after periods.

##### Comment Annotations
- Annotations should usually be written on the line immediately above the relevant code.
- Format, for multiple lines indent the next lines
```ruby
def bar
    # FIXME: This has crashed occasionally since v3.2.1. It may
    #   be related to the BarBazUtil upgrade.
    baz(:quux)
end
```
- Examples: TODO, FIXME, OPTIMIZE, HACK (to note code smells where questionable coding practices were used and should be refactored away.), REVIEW

#### Classes & modules
- Use a consistent ordering
```ruby
class Person
    # extend and include go first
    extend SomeModule
    include AnotherModule

    # inner classes
    CustomError = Class.new(StandardError)

    # constants are next
    SOME_CONSTANT = 20

    # afterwards we have attribute macros
    attr_reader :name

    # followed by other macros (if any)
    validates :name

    # public class methods are next in line
    def self.some_method
    end

    # initialization goes between class methods and other instance methods
    def initialize
    end

    # followed by other public instance methods
    def some_method
    end

    # protected and private methods are grouped near the end
    protected

    def some_protected_method
    end

    private

    def some_private_method
    end
end
```
- Prefer modules to classes with only class methods. Classes should be used only when it makes sense to create instances out of them.
- Favor the use of module_function over extend self when you want to turn a module's instance methods into class methods.
- Use SOLID principles
- Always supply a proper to_s method for classes that represent domain objects.
- Prefer duck-typing over inheritance
- Assign proper visibility levels to methods (private, protected) in accordance with their intended usage. Don't go off leaving everything public (which is the default).

#### Exceptions
- Do not return from an ensure block. If you explicitly return from a method inside an ensure block, the return will take precedence over any exception being raised, and the method will return as if no exception had been raised at all. In effect, the exception will be silently thrown away
- Use implicit begin blocks where possible
```ruby
def foo
  # main logic goes here
rescue
  # failure handling goes here
end
```
- Put more specific exceptions higher up the rescue chain, otherwise they'll never be rescued from.
- Release external resources obtained by your program in an ensure block.
```ruby
f = File.open('testfile')
begin
  # .. process
rescue
  # .. handle error
ensure
  f.close if f
end
```

#### Collections
- Prefer literal array and hash creation notation (unless you need to pass parameters to their constructors, that is).
  - bad:
  ```ruby
  arr = Array.new
  hash = Hash.new
  ```
  - good:
  ```ruby
  arr = []
  arr = Array.new(10)
  hash = {}
  hash = Hash.new(0)
  ```
- Prefer %w (white space separated array) to the literal array syntax when you need an array of words (non-empty strings without spaces and special characters in them). Apply this rule only to arrays with two or more elements. And %i for array of symbols
```ruby
STATES = %w[draft open closed]
```
- When accessing the first or last element from an array, prefer first or last over [0] or [-1]
##### Hashes
- Avoid the use of mutable objects as hash keys.
- Use Hash#each_key instead of Hash#keys.each and Hash#each_value instead of Hash#values.each.
- Use Hash#fetch when dealing with hash keys that should be present.
  - `heroes.fetch(:supermann)` would raise a KeyError if the key doesn't exists
  - Use it instead of `heroes[:supermann]` which just returns nil
- Use Hash#values_at when you need to retrieve several values consecutively from a hash
  - `email, username = data.values_at('email', 'nickname')`

#### Strings
- Prefer string interpolation and string formatting instead of string concatenation (+):
  - Good
  ```ruby
  email_with_name = "#{user.name} <#{user.email}>"
  ```
  - Good
  ```ruby
  email_with_name = format('%s <%s>', user.name, user.email)
  ```
