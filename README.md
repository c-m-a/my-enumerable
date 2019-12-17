# My Enumerable Method

This project is based on the [The Odin's Project | Replicating de Enumerable Module from Ruby](https://www.theodinproject.com/courses/ruby-programming/lessons/advanced-building-blocks#assignment-2).



For this project I used BEM for naming convention and I a specificity tool to make the CSS file more eficient when the browser loads the site's styles sheets.

To see more feather details about this project you can click on the next video.

## Getting Started

### Prerequisites

You need a Web Browser compatible with FLEXBOX, i.e. Chrome Ver. >= 57,
Mozilla Ver. >= 52, Microsoft Edge Ver. >= 16 and Safari Ver. 10.3.

### Install

```sh
git clone https://github.com/anicma/my-enumerable
cd my-enumerable
create app.rb
```

```vim
# and add this line to your fine
include 'lib/enumerable'
```

### Documentation

You can check the [ruby ver. 2.6.5 documentation from Enumerable](https://ruby-doc.org/core-2.6.5/Enumerable.html).

#### my_all? [{ |obj| block } ] → true or false click to toggle source
#### my_all?(pattern) → true or false

Passes each element of the collection to the given block. The method returns true
 if the block never returns `false ` or `nil`. If the block is not given, Ruby
 adds an implicit block of `{ |obj| obj }` which will cause **all?** to return true
 when none of the collection members are false or nil.

If instead a pattern is supplied, the method returns whether `pattern === element` for every collection member.

```ruby
%w[ant bear cat].all? { |word| word.length >= 3 } #=> true
%w[ant bear cat].all? { |word| word.length >= 4 } #=> false
%w[ant bear cat].all?(/t/)                        #=> false
[1, 2i, 3.14].all?(Numeric)                       #=> true
[nil, true, 99].all?                              #=> false
[].all?                                           #=> true
```

#### my_any?(pattern) → true or false

Passes each element of the collection to the given block. The method returns true
 if the block ever returns a value other than `false` or `nil.` If the block is not
 given, Ruby adds an implicit block of `{ |obj| obj }` that will cause `any?` to
 return true if at least one of the collection members is not `false` or `nil`.

If instead a pattern is supplied, the method returns whether `pattern === element` for any collection member.

```ruby
%w[ant bear cat].any? { |word| word.length >= 3 } #=> true
%w[ant bear cat].any? { |word| word.length >= 4 } #=> true
%w[ant bear cat].any?(/d/)                        #=> false
[nil, true, 99].any?(Integer)                     #=> true
[nil, true, 99].any?                              #=> true
[].any?                                           #=> false
```

#### my_each_with_index(*args) { |obj, i| block } → enum
#### my_each_with_index(*args) → an_enumerator

Calls block with two arguments, the item and its index, for each item in enum.
 Given arguments are passed through to `each()`.

If no block is given, an enumerator is returned instead.

```ruby
hash = Hash.new
%w(cat dog wombat).each_with_index { |item, index|
  hash[item] = index
}
hash   #=> {"cat"=>0, "dog"=>1, "wombat"=>2}
```

#### my_select { |obj| block } → array
#### my_select → an_enumerator

Returns an array containing all elements of enum for which the given block returns
 a true value.

If no block is given, an Enumerator is returned instead.

```ruby
(1..10).find_all { |i|  i % 3 == 0 }   #=> [3, 6, 9]

[1,2,3,4,5].select { |num|  num.even?  }   #=> [2, 4]

[:foo, :bar].filter { |x| x == :foo }   #=> [:foo]
```

#### my_count → int
#### count(item) → int
#### count { |obj| block } → int

Returns the number of items in enum through enumeration. If an argument is given,
 the number of items in enum that are equal to item are counted. If a block is
 given, it counts the number of elements yielding a true value.

```ruby
ary = [1, 2, 4, 2]
ary.count               #=> 4
ary.count(2)            #=> 2
ary.count{ |x| x%2==0 } #=> 3
```

#### my_map { |obj| block } → array click to toggle source
#### map → an_enumerator

Returns a new array with the results of running block once for every element in
 enum.

If no block is given, an enumerator is returned instead.

```ruby
(1..4).map { |i| i*i }      #=> [1, 4, 9, 16]
(1..4).collect { "cat"  }   #=> ["cat", "cat", "cat", "cat"]
```

#### my_inject(initial, sym) → obj
#### my_inject(sym) → obj
#### my_inject(initial) { |memo, obj| block } → obj
#### my_inject { |memo, obj| block } → obj

Combines all elements of enum by applying a binary operation, specified by a
 block or a symbol that names a method or operator.

The inject and reduce methods are aliases. There is no performance benefit to either.

If you specify a block, then for each element in enum the block is passed an
 accumulator value (memo) and the element. If you specify a symbol instead, then
 each element in the collection will be passed to the named method of memo. In
 either case, the result becomes the new value for memo. At the end of the iteration, the final value of memo is the return value for the method.

If you do not explicitly specify an initial value for memo, then the first element
 of collection is used as the initial value of memo.

```ruby
# Sum some numbers
(5..10).reduce(:+)                             #=> 45
# Same using a block and inject
(5..10).inject { |sum, n| sum + n }            #=> 45
# Multiply some numbers
(5..10).reduce(1, :*)                          #=> 151200
# Same using a block
(5..10).inject(1) { |product, n| product * n } #=> 151200
# find the longest word
longest = %w{ cat sheep bear }.inject do |memo, word|
   memo.length > word.length ? memo : word
end
longest                                        #=> "sheep"
```

### Authors:

- Cmauricio Parra | [@cma4c](https://twitter.com/@cma4c)

### License

This project is licensed under the NON License. see the LICENSE.md file for details.

