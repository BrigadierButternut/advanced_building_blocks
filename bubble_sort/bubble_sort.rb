#!/home/laura/Desktop/odin_project/ruby_programming/advanced_building_blocks/bubble_sort/bubble_sort.rb

#NOTE: THE ABOVE IS A SHEBANG LINE; IT ALLOWS THE PROGRAM TO BE RUN VIA THE CONSOLE USING THE COMMAND $ chmod +x your_filename.rb

#A bubble sort sorts an array by comparing one value to the value next to it and swapping the two if the initial value is larger

def bubble_sort(values)
  compare = values.length
  while compare > 0
    count = 0
    #iterate through every index of the array
    while count < (compare-1)
      if values[count] > values[count+1]
        values[count], values[count+1] = values[count+1], values[count]
      end #end of if statment
      count += 1
    end #end of inner while loop
    compare -= 1
  end #end of outer while loop
  values
end

sorted_array = bubble_sort([4,3,78,2,0,2])


def bubble_sort_by(values)
  compare = values.length
  while compare > 0
    count = 0
    #iterate through every index of the array
    while count < (compare-1)
      if yield(values[count],values[count+1]) > 0
        values[count], values[count+1] = values[count+1], values[count]
      end #end of if statment
      count += 1
    end #end of inner while loop
    compare -= 1
  end #end of outer while loop
  values
end

sorted_values = bubble_sort_by(["hi","hello","hey"]) {|left,right| left.length - right.length}
