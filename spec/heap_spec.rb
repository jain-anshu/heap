# frozen_string_literal: true

require './lib/heap'

describe 'MinHeap' do
  describe '#peek' do
    it 'returns the smallest number in the MinHeap' do
      mh = MinHeap.new
      mh.insert(3)
      mh.insert(5)
      mh.insert(2)
      expect(mh.peek).to eql(2)
    end
  end
end
