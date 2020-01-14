# frozen_string_literal: true

require 'enumerable'

RSpec.describe Enumerable, '#my_each' do
  context 'no block' do
    let(:arr) { [1, 2] }
    it 'no block given return Enumerator' do
      native = arr.each.class
      expect(arr.my_each.class).to eq native
    end
  end
end
