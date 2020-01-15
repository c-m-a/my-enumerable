# frozen_string_literal: true

require 'enumerable'

RSpec.describe Enumerable do
  describe '#my_each' do
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

  describe '#my_each_with_index' do
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

  describe '#my_select' do
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

  describe '#my_all?' do
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

  describe '#my_any?' do
    context 'no block given' do
      let(:arr) { [1, 2] }
      it 'returns Boolean' do
        native = arr.any?.class
        expect(arr.my_any?.class).to eq native
      end
    end
    context 'block given' do
      let(:arr) { [1, 2] }
      it 'returns Enumerator' do
        native = arr.any? { |n| arr.include?(n) }
        expect(arr.my_any? { |n| arr.include?(n) }).to eq native
      end
    end
  end

  describe '#my_none?' do
    context 'no block given' do
      let(:arr) { [1, 2] }
      it 'returns Boolean' do
        native = arr.none?.class
        expect(arr.my_none?.class).to eq native
      end
    end
    context 'block given' do
      let(:arr) { [1, 2] }
      it 'returns Enumerator' do
        native = arr.none? { |n| arr.include?(n) }
        expect(arr.my_none? { |n| arr.include?(n) }).to eq native
      end
    end
  end

  describe '#my_count' do
    context 'no block given' do
      let(:arr) { [1, 2] }
      it 'returns Integer' do
        native = arr.count.class
        expect(arr.my_count.class).to eq native
      end
    end
    context 'block given' do
      let(:arr) { [1, 2] }
      it 'returns Integer' do
        native = arr.count { |n| arr.include?(n) }
        expect(arr.my_count { |n| arr.include?(n) }).to eq native
      end
    end
  end

  describe '#my_map' do
    context 'no block given' do
      let(:arr) { [1, 2] }
      it 'returns Enumerator' do
        native = arr.map.class
        expect(arr.my_map.class).to eq native
      end
    end
    context 'block given' do
      let(:arr) { [1, 2] }
      it 'returns Enumerator' do
        native = arr.map { |n| arr.include?(n) }
        expect(arr.my_map { |n| arr.include?(n) }).to eq native
      end
    end
  end

  describe '#my_inject' do
    context 'no block given' do
      let(:arr) { [1, 2] }
      it 'returns Object' do
        native = arr.inject(:+)
        expect(arr.my_inject(:+)).to eq native
      end
    end
    context 'block given' do
      let(:arr) { [1, 2] }
      it 'returns Object' do
        native = arr.inject { |_a, n| arr.include?(n) }
        expect(arr.my_inject { |_a, n| arr.include?(n) }).to eq native
      end
    end
  end
end
