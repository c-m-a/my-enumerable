# frozen_string_literal: true

module Enumerable
  def my_each
    return p to_enum(__method__) unless block_given?

    i = 0
    array = self.class == Array ? self : to_a

    while i < size
      yield(array[i])
      i += 1
    end

    self
  end

  def my_each_with_index
    return to_enum(__method__) unless block_given?

    i = 0
    array = self.class == Array ? self : to_a

    while i < size
      yield(array[i], i)
      i += 1
    end

    self
  end

  def my_select
    return to_enum(__method__) unless block_given?

    arr = []

    my_each { |e| arr << e if yield(e) }

    arr
  end

  def my_all?(pattern = nil, &block)
    my_each { |e| return false unless block.call(e) } if block_given?
    my_each { |e| return false unless e } unless pattern && block_given?

    case pattern
    when Class
      my_each { |e| return false unless e.class == pattern || e.class < pattern }
    when TrueClass, FalseClass
      my_each { |e| return false unless e.class == pattern.class }
    when Range
      my_each { |e| return false unless pattern.include? e }
    when Regexp
      my_each do |e|
        return false if e.class != String
        return false if pattern.match(e).nil?
      end
    else
      my_each { |e| return false if e } unless pattern.nil?
    end

    true
  end

  def my_any?(pattern = nil, &block)
    my_each { |e| return true if block.call(e) } if block_given?

    case pattern
    when Class
      my_each { |e| return true if e.class == pattern || e.class < pattern }
    when TrueClass, FalseClass
      my_each { |e| return true if e.class == pattern.class }
    when Range
      my_each { |e| return true if pattern.include? e }
    when Regexp
      my_each do |e|
        return false if e.class != String
        return true unless pattern.match(e).nil?
      end
    else
      my_each { |e| return true if e } if pattern.nil?
    end

    false
  end

  def none?
    my_each { |e| return false if block.call(e) } if block_given?
    my_each { |e| return false if e.class == pattern || e.class < pattern } if pattern.class == Class
    my_each { |e| return false if e =~ pattern } if pattern.class == Regexp
    my_each { |e| return false if e == pattern } if [Integer, String].include?(pattern.class)
    my_each { |e| return false if e } if !pattern && !block_given?
    true
  end

  def my_count(item = nil, &block)
    count = 0
    my_each { |e| count += 1 if e == item } if item
    return count if item

    my_each { |e| count += 1 if block.call(e) } if block_given?
    return count if block_given?

    my_each { count += 1 } unless item && block_given?
    count
  end

  def my_map
    return p to_enum(__method__) unless block_given?

    array = []

    my_each { |e| array << yield(e) }

    array
  end

  def my_inject(initial = nil, sym = nil, &block)
    acc = initial || first
    acc = initial.class == Symbol ? first : initial
    acc -= acc if acc != initial && acc.class != String
    my_each { |e| acc = block.call(acc, e) } if block_given?
    my_each { |e| acc = acc.send(sym, e) } if initial && sym
    my_each { |e| acc = acc.send(initial, e) } if initial.class == Symbol
    acc
  end
end

def multiply_els(array)
  array.my_inject(1) { |acc, n| acc * n }
end

puts multiply_els([5, 8, 9])
