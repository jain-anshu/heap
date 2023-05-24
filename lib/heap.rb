class MinHeap
    def initialize
      @heap = []
    end

    def peek
      @heap[0]
    end

    def insert(val)
        @heap << val
        heapify_up(@heap.length - 1)
    end
    
    def get_min
        return nil if @heap.empty?
        
        swap(0, @heap.length - 1)
        val = @heap.pop()
        heapify_down(0)
        val
    end

    def size
        @heap.length - 1
    end

    private
    def heapify_up(ind)
        parent_ind = (ind - 1) / 2

        if ind > 0 && @heap[parent_ind] > @heap[ind]
            swap(ind, parent_ind)
            heapify_up(parent_ind)
        end    
    end

    def heapify_down(ind)
        l_child_ind = ind * 2 + 1
        r_child_ind = ind * 2 + 2
        smallest = ind
        if l_child_ind < @heap.length && @heap[l_child_ind] < @heap[smallest]
            smallest = l_child_ind
        end
        
        if r_child_ind < @heap.length && @heap[r_child_ind] < @heap[smallest]
            smallest = r_child_ind
        end

        if smallest != ind
            swap(ind, smallest)
            heapify_down(smallest)
        end
    end

    def swap(i, j)
        @heap[i], @heap[j] = @heap[j], @heap[i]
    end
end                                                                   