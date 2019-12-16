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
    return true if pattern.nil? ^ block_given?

    my_each { |e| return false unless block.call(e) } if block_given?

    case pattern
    when Class
      my_each { |e| return false unless e.class == pattern }
    when TrueClass
      my_each { |e| return false unless e.class == pattern.class }
    when Range
      my_each { |e| return false unless pattern.include? e }
    when Regexp
      my_each do |e|
        return false if e.class != String
        return false if pattern.match(e).nil?
      end
    end

    true
  end

  def my_any?(pattern = nil)
    return true if pattern.nil? ^ block_given?

    i = 0
    is_a_class = pattern.is_a? Class
    array = self.class == Array ? self : to_a

    while i < size
      any =
        if is_a_class
          array[i].is_a? pattern
        else
          truthy? yield(array[i])
        end

      break if any == true

      i += 1
    end

    any
  end

  def truthy?(value)
    ([true, false].include? value) && value
  end
end
