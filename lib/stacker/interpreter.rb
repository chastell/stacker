module Stacker class Interpreter
  attr_reader :stack

  def initialize
    @stack = []
  end

  def execute convict
    case convict
    when /^\d+$/    then stack << convict.to_i
    when ':true'    then stack << :true
    when '<'        then stack << (stack.pop > stack.pop).to_s.to_sym
    when '>'        then stack << (stack.pop < stack.pop).to_s.to_sym
    when 'ADD'      then stack << stack.pop + stack.pop
    when 'DIVIDE'   then a = stack.pop; b = stack.pop; stack << b / a
    when 'DROP'     then stack.pop
    when 'DUP'      then stack << stack.last
    when 'MOD'      then a = stack.pop; b = stack.pop; stack << b % a
    when 'MULTIPLY' then stack << stack.pop * stack.pop
    when 'SUBTRACT' then a = stack.pop; b = stack.pop; stack << b - a
    when 'SWAP'     then a = stack.pop; b = stack.pop; stack << a; stack << b
    when 'THEN'
      if_false, _, if_true, _, cond = stack.pop, stack.pop, stack.pop, stack.pop, stack.pop
      stack << (cond == :true ? if_true : if_false)
    else                 stack << convict
    end
  end
end end
