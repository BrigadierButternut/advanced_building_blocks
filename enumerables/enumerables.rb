module Enumerable
def my_each
  count = 0
  while count < self.length
    yield(self[count])
    count += 1
  end
  self
end

def my_each_with_index
  count = 0
  while count < self.length
    yield(self[count],count)
    count += 1
  end
  self
end

def my_select
  true_array = []
  self.my_each do |element|
  if yield(element) == true
    true_array << element
  end
  end
  true_array
end

def my_all?
  true_values = []
  self.my_each do |element|
    if yield(element) == false
      break
    else
      true_values << element
    end
  end
  if true_values.length == self.length
    return true
  else
    return false
  end
end

def my_any?
  check = false
  self.my_each do |element|
    if yield(element) == true
      check = true
      break
    end
  end
  return check
end

def my_none?
  check = true
  self.my_each do |element|
    if yield(element) == true
      check = false
      break
    end
  end
  return check
end

def my_count
  if block_given?
    true_values = []
    self.my_each do |element|
      if yield(element) == true
        true_values << element
      end
    end
    true_values.length
  else
    self.length
  end
end

def my_map(&proc)
  if proc
    self.my_each do |element|
      proc.call(element)
    end
  elseif block_given?
    new_array = []
    self.my_each do |element|
      new_array << yield(element)
    end
    new_array
  else
    return self
  end
end

 def my_inject
  total = self.first
  self[1..-1].my_each do |element|
    total = yield(total,element)
  end
  total
  end

def multiply_els
  self.my_inject do |product,num|
    product*num
  end
end


end #end of module
