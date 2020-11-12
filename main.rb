module Enumerable
    
def my_each
    return to_enum(:my_each) unless block_given?
    counter = 0
    while counter < to_a.length
        yield to_a[counter]
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


def my_all?(value = nil)
    if(block_given?)  
    to_a.my_each{ |i| return false if yield(i) == false }   
    return true
    elsif value.nil?
    to_a.my_each { |i| return false if i.nil? || i == false }
    elsif !value.nil? && (value.is_a? Class)
    to_a.my_each { |i| return false unless i.is_a? value }
    elsif !value.nil? && value.instance_of?(Regexp)
    to_a.my_each { |i| return false unless value.match(i) }
    else
    to_a.my_each { |i| return false if i != value }
   end
  true
end

def my_any(param=nil)
    if(block_given?)
    to_a.my_each { |i| return true if yield(i) }
    return false
    elseif param.nil?
    to_a.my_each{ |i| return true if i }
    elsif param is _a? Class
    to_a.my_each { |i| return true if i.is_a? param }
    elsif param.instance_of(Regexp)
    to_a.my_each { |i| return true unless param.match(i).nil? }
    else
    to_a.my_each{ |i| return true if param == true }
    end
  false
  end


def my_none(value=nil, &block)
    !to_a.my_any?(value, &block)
end