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
    return p to_enum(__method__) unless block_given?

    i = 0
    array = self.class == Array ? self : to_a

    while i < size
      yield(array[i], i)
      i += 1
    end

    self
  end

  def my_select
    return p to_enum(__method__) unless block_given?

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

  def boolean?(value)
    [true, false].include? value
  end
end
