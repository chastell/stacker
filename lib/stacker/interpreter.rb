module Stacker class Interpreter
  def execute convict
    case convict
    when 'ADD'
      stack << stack.pop + stack.pop
    when 'MULTIPLY'
      stack << stack.pop * stack.pop
    else
      stack << convict.to_i
    end
  end

  def stack
    @stack ||= []
  end
end end
