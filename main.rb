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

    
def my_each_with_index
    return to enum(:my_each_with_index) unless block_given?
    counter = 0
    while counter < to_a.length
        yield (to_a[counter], counter)
        counter += 1
    end 
    self
end

def my_select
    return to_enum(:my_select) unless block_given?

    arr = []
    to_a.my_each{ |item| arr << item  if yield(item) || yield(item[0]) && instance_of?(Hash) }
    instance_of?(Hash) ? arr.to_h : arr
    end


        