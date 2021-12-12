module Validation 
  # filter for (, ), :) or :(
  def filter(text)
    counter = 0
    stack = []
    dotsCache = ''
    text.split('').each do |char|
      counter += 1 if dotsCache == ':'
      if char == ':'
        dotsCache = char
        counter = 1 
      end
      ['(',')'].each do |sample|
        if char == sample
          stack<<(dotsCache+char)
        end
      end
      dotsCache = '' if counter == 2
    end
    return stack
  end
  # function to delete pairs of ()
  def deletePairs(currentStack,sample)
    stack2 = []
    currentStack.each do |element|
      next if element == ':'
      if sample[element]
        index = stack2.rindex(sample[element])
        if index 
          stack2.delete_at(index)
        else
          stack2<<element
        end
      else
        stack2 << element
      end
    end
    return stack2
  end
  # function to check if the stack is valid
  def validate(currentStack)
    return (currentStack.empty?||(!currentStack.include?('(')&&!currentStack.include?(')')))
  end
  
  def start(value)
    stack = filter(value)
    balanced = false
    3.times do |i|
      samples = [{')'=>'('},{':)'=>'('}, {')'=>':('}]
      stack = deletePairs(stack,samples[i])
      if validate(stack)
        balanced = true
        break
      end
    end
    balanced ? ("balanceado") : ("desbalanceado")
  end
end