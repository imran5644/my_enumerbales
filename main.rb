module Enumerable
    def my_each
        return to_enum(:my_each) unless block_given?
        counter = 0
        while counter < to_a.length
            yield to_a[count]
            counter += 1
        end
        self
    end

    
