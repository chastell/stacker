module Stacker class Interpreter
  attr_reader :stack

  def initialize
    @stack = []
  end

  def execute convict
    case convict
    when /^\d+$/    then stack << convict.to_i
    when '<'        then stack << (stack.pop > stack.pop).to_s.to_sym
    when '>'        then stack << (stack.pop < stack.pop).to_s.to_sym
    when 'ADD'      then stack << stack.pop + stack.pop
    when 'MULTIPLY' then stack << stack.pop * stack.pop
    else                 stack << convict
    end
  end
end end
