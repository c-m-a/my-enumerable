# frozen_string_literal: true

require 'enumerable'

RSpec.describe Enumerable, '#my_each' do
  context 'no block given' do
    let(:arr) { [1, 2] }
    it 'returns Enumerator' do
      native = arr.each.class
      expect(arr.my_each.class).to eq native
    end
  end
  context 'block given' do
    let(:arr) { [1, 2] }
    it 'returns Enumerator' do
      native = arr.each { |n| arr.include?(n) }
      expect(arr.my_each { |n| arr.include?(n) }).to eq native
    end
  end
end

RSpec.describe Enumerable, '#my_each_with_index' do
  context 'no block given' do
    let(:arr) { [1, 2] }
    it 'returns Enumerator' do
      native = arr.each_with_index.class
      expect(arr.my_each_with_index.class).to eq native
    end
  end
  context 'block given' do
    let(:arr) { [1, 2] }
    it 'returns Enumerator' do
      native = arr.each_with_index { |n, _idx| arr.include?(n) }
      expect(arr.my_each_with_index { |n, _idx| arr.include?(n) }).to eq native
    end
  end
end

RSpec.describe Enumerable, '#my_select' do
  context 'no block given' do
    let(:arr) { [1, 2] }
    it 'returns Enumerator' do
      native = arr.select.class
      expect(arr.my_each_with_index.class).to eq native
    end
  end
  context 'block given' do
    let(:arr) { [1, 2] }
    it 'returns Enumerator' do
      native = arr.select { |n| arr.include?(n) }
      expect(arr.my_select { |n| arr.include?(n) }).to eq native
    end
  end
end

RSpec.describe Enumerable, '#my_all?' do
  context 'no block given' do
    let(:arr) { [1, 2] }
    it 'returns Boolean' do
      native = arr.all?.class
      expect(arr.my_all?.class).to eq native
    end
  end
  context 'block given' do
    let(:arr) { [1, 2] }
    it 'returns Enumerator' do
      native = arr.all? { |n| arr.include?(n) }
      expect(arr.my_all? { |n| arr.include?(n) }).to eq native
    end
  end
end
