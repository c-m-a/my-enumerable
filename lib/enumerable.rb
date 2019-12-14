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

    i = 0
    array = self.class == Array ? self : to_a
    array_rs = []

    while i < size
      result = yield(array[i])
      boolean_and_true = (boolean? result) && (result == true)

      array_rs << array[i] if boolean_and_true
      i += 1
    end

    array_rs
  end

  def my_all?(pattern = nil)
    return true if pattern.nil? ^ block_given?

    i = 0
    is_a_class = pattern.is_a? Class
    array = self.class == Array ? self : to_a

    while i < size
      all =
        if is_a_class
          array[i].is_a? pattern
        else
          truthy? yield(array[i])
        end

      break unless all == true

      i += 1
    end

    all
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
