class Forth

  def self.evaluate(seq : String)
    stack = [] of Int32
    user_definitions = {} of String => String
    seq.split(';').each do |chunk|
      eval_chunk(chunk, stack, user_definitions)
    end
    stack
  end

  private def self.eval_chunk(chunk, stack, user_definitions)
    if chunk.starts_with?(':')
      eval_definition(chunk, user_definitions)
    else
      eval_code(chunk, stack, user_definitions)
    end
  end

  private def self.eval_code(code, stack, user_definitions)
    code.downcase.split.each do |elem|
      if user_definitions.has_key? elem
        eval_code(user_definitions[elem], stack, user_definitions)
      else
        case elem
        when "+"    ; stack.push(stack.pop + stack.pop)
        when "-"    ; stack.push(-stack.pop + stack.pop)
        when "*"    ; stack.push(stack.pop * stack.pop)
        when "/"    ; stack.push(((1 / stack.pop) * stack.pop).to_i)
        when "dup"  ; stack.push(stack.last)
        when "drop" ; stack.pop
        when "swap" ; stack.push(stack.pop, stack.pop)
        when "over" ; stack.push(stack[-2])
        else        ; stack.push elem.to_i
        end
      end
    end
  end

  private def self.eval_definition(definition, user_definitions)
    definition.scan(/: (\S+)\s+(.+)/) do |match|
      raise ArgumentError.new if match[1].to_i?
      user_definitions[match[1].downcase] = match[2]
    end
  end
end
