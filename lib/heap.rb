# frozen_string_literal: true

class MinHeap
  def initialize
    @heap = []
  end

  def peek
    @heap[0]
  end

  def insert(val)
    @heap << val
    heapify_up(last_ind)
  end

  def get_min
    return nil if @heap.empty?

    swap(0, last_ind)
    val = @heap.pop
    heapify_down(0)
    val
  end

  private

  def heapify_up(ind)
    parent_ind = (ind - 1) / 2

    return unless ind.positive? && compare(ind, parent_ind)

    swap(ind, parent_ind)
    heapify_up(parent_ind)
  end

  def heapify_down(ind)
    l_child_ind = ind * 2 + 1
    r_child_ind = ind * 2 + 2
    smallest = ind
    smallest = l_child_ind if compare(l_child_ind, smallest)

    smallest = r_child_ind if compare(r_child_ind, smallest)

    return unless smallest != ind

    swap(ind, smallest)
    heapify_down(smallest)
  end

  def compare(i, j)
    i < @heap.length && @heap[i] < @heap[j]
  end

  def swap(i, j)
    @heap[i], @heap[j] = @heap[j], @heap[i]
  end

  def last_ind
    @heap.length - 1
  end
end
