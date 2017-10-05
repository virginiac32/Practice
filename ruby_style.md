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
