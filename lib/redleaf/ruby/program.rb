# -*- ruby -*-

module RedLeaf::Ruby::Program
  include Treetop::Runtime

  def root
    @root || :program
  end

  include RedLeaf::Ruby::Literals

  include RedLeaf::Ruby::Keywords

  def _nt_program
    start_index = index
    if node_cache[:program].has_key?(index)
      cached = node_cache[:program][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    r1 = _nt_open_class
    if r1
      r0 = r1
    else
      r2 = _nt_open_module
      if r2
        r0 = r2
      else
        r3 = _nt_def_method
        if r3
          r0 = r3
        else
          self.index = i0
          r0 = nil
        end
      end
    end

    node_cache[:program][start_index] = r0

    return r0
  end

  module DefMethod0
    def space
      elements[1]
    end

    def method_name
      elements[2]
    end

    def args
      elements[4]
    end

    def space_nl
      elements[5]
    end

    def end_keyword
      elements[7]
    end
  end

  module DefMethod1
    def sexp
      [:defn, method_name.text_value.intern,
        [:scope, 
         [:block, 
          args.empty? ? [:args] : args.sexp, 
          [:nil]
         ]]]
    end
  end

  def _nt_def_method
    start_index = index
    if node_cache[:def_method].has_key?(index)
      cached = node_cache[:def_method][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index('def', index) == index
      r1 = (SyntaxNode).new(input, index...(index + 3))
      @index += 3
    else
      terminal_parse_failure('def')
      r1 = nil
    end
    s0 << r1
    if r1
      r2 = _nt_space
      s0 << r2
      if r2
        r3 = _nt_method_name
        s0 << r3
        if r3
          r5 = _nt_space
          if r5
            r4 = r5
          else
            r4 = SyntaxNode.new(input, index...index)
          end
          s0 << r4
          if r4
            r7 = _nt_method_arguments
            if r7
              r6 = r7
            else
              r6 = SyntaxNode.new(input, index...index)
            end
            s0 << r6
            if r6
              r8 = _nt_space_nl
              s0 << r8
              if r8
                r10 = _nt_method_body
                if r10
                  r9 = r10
                else
                  r9 = SyntaxNode.new(input, index...index)
                end
                s0 << r9
                if r9
                  r11 = _nt_end_keyword
                  s0 << r11
                end
              end
            end
          end
        end
      end
    end
    if s0.last
      r0 = (SyntaxNode).new(input, i0...index, s0)
      r0.extend(DefMethod0)
      r0.extend(DefMethod1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:def_method][start_index] = r0

    return r0
  end

  module MethodName0
    def ruby_identifier
      elements[0]
    end

  end

  def _nt_method_name
    start_index = index
    if node_cache[:method_name].has_key?(index)
      cached = node_cache[:method_name][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_ruby_identifier
    s0 << r1
    if r1
      i3 = index
      if input.index('?', index) == index
        r4 = (SyntaxNode).new(input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure('?')
        r4 = nil
      end
      if r4
        r3 = r4
      else
        if input.index('=', index) == index
          r5 = (SyntaxNode).new(input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('=')
          r5 = nil
        end
        if r5
          r3 = r5
        else
          if input.index('!', index) == index
            r6 = (SyntaxNode).new(input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure('!')
            r6 = nil
          end
          if r6
            r3 = r6
          else
            self.index = i3
            r3 = nil
          end
        end
      end
      if r3
        r2 = r3
      else
        r2 = SyntaxNode.new(input, index...index)
      end
      s0 << r2
    end
    if s0.last
      r0 = (SyntaxNode).new(input, i0...index, s0)
      r0.extend(MethodName0)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:method_name][start_index] = r0

    return r0
  end

  module ArgumentList0
    def ruby_identifier
      elements[0]
    end

    def argument_list
      elements[4]
    end
  end

  module ArgumentList1
    def sexp
      [:args, ruby_identifier.text_value.intern] + argument_list.sexp[1..-1]
    end
  end

  module ArgumentList2
    def ruby_identifier
      elements[0]
    end

  end

  module ArgumentList3
    def sexp
      [:args, ruby_identifier.text_value.intern]
    end
  end

  def _nt_argument_list
    start_index = index
    if node_cache[:argument_list].has_key?(index)
      cached = node_cache[:argument_list][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    i1, s1 = index, []
    r2 = _nt_ruby_identifier
    s1 << r2
    if r2
      r4 = _nt_space
      if r4
        r3 = r4
      else
        r3 = SyntaxNode.new(input, index...index)
      end
      s1 << r3
      if r3
        if input.index(',', index) == index
          r5 = (SyntaxNode).new(input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure(',')
          r5 = nil
        end
        s1 << r5
        if r5
          r7 = _nt_space
          if r7
            r6 = r7
          else
            r6 = SyntaxNode.new(input, index...index)
          end
          s1 << r6
          if r6
            r8 = _nt_argument_list
            s1 << r8
          end
        end
      end
    end
    if s1.last
      r1 = (SyntaxNode).new(input, i1...index, s1)
      r1.extend(ArgumentList0)
      r1.extend(ArgumentList1)
    else
      self.index = i1
      r1 = nil
    end
    if r1
      r0 = r1
    else
      i9, s9 = index, []
      r10 = _nt_ruby_identifier
      s9 << r10
      if r10
        r12 = _nt_space
        if r12
          r11 = r12
        else
          r11 = SyntaxNode.new(input, index...index)
        end
        s9 << r11
      end
      if s9.last
        r9 = (SyntaxNode).new(input, i9...index, s9)
        r9.extend(ArgumentList2)
        r9.extend(ArgumentList3)
      else
        self.index = i9
        r9 = nil
      end
      if r9
        r0 = r9
      else
        self.index = i0
        r0 = nil
      end
    end

    node_cache[:argument_list][start_index] = r0

    return r0
  end

  module MethodArguments0
    def argument_list
      elements[1]
    end

  end

  module MethodArguments1
    def sexp
      argument_list.sexp
    end
  end

  def _nt_method_arguments
    start_index = index
    if node_cache[:method_arguments].has_key?(index)
      cached = node_cache[:method_arguments][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    i1, s1 = index, []
    if input.index('(', index) == index
      r2 = (SyntaxNode).new(input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('(')
      r2 = nil
    end
    s1 << r2
    if r2
      r3 = _nt_argument_list
      s1 << r3
      if r3
        if input.index(')', index) == index
          r4 = (SyntaxNode).new(input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure(')')
          r4 = nil
        end
        s1 << r4
      end
    end
    if s1.last
      r1 = (SyntaxNode).new(input, i1...index, s1)
      r1.extend(MethodArguments0)
      r1.extend(MethodArguments1)
    else
      self.index = i1
      r1 = nil
    end
    if r1
      r0 = r1
    else
      r5 = _nt_argument_list
      if r5
        r0 = r5
      else
        self.index = i0
        r0 = nil
      end
    end

    node_cache[:method_arguments][start_index] = r0

    return r0
  end

  module MethodBody0
    def sexp
      [:nil]
    end
  end

  def _nt_method_body
    start_index = index
    if node_cache[:method_body].has_key?(index)
      cached = node_cache[:method_body][index]
      @index = cached.interval.end if cached
      return cached
    end

    r0 = _nt_space
    r0.extend(MethodBody0)

    node_cache[:method_body][start_index] = r0

    return r0
  end

  module OpenClass0
    def space
      elements[1]
    end

    def module_name
      elements[2]
    end

    def sub_class
      elements[3]
    end

    def module_body
      elements[4]
    end

    def end_keyword
      elements[6]
    end
  end

  module OpenClass1
    def sexp 
      name = module_name.sexp
      name = name.last if name.first == :const
      [:class, name, sub_class.sexp, module_body.sexp]
    end
  end

  def _nt_open_class
    start_index = index
    if node_cache[:open_class].has_key?(index)
      cached = node_cache[:open_class][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index('class', index) == index
      r1 = (SyntaxNode).new(input, index...(index + 5))
      @index += 5
    else
      terminal_parse_failure('class')
      r1 = nil
    end
    s0 << r1
    if r1
      r2 = _nt_space
      s0 << r2
      if r2
        r3 = _nt_module_name
        s0 << r3
        if r3
          r4 = _nt_sub_class
          s0 << r4
          if r4
            r5 = _nt_module_body
            s0 << r5
            if r5
              r7 = _nt_space_nl
              if r7
                r6 = r7
              else
                r6 = SyntaxNode.new(input, index...index)
              end
              s0 << r6
              if r6
                r8 = _nt_end_keyword
                s0 << r8
              end
            end
          end
        end
      end
    end
    if s0.last
      r0 = (SyntaxNode).new(input, i0...index, s0)
      r0.extend(OpenClass0)
      r0.extend(OpenClass1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:open_class][start_index] = r0

    return r0
  end

  module SubClass0
    def space
      elements[2]
    end

    def name
      elements[3]
    end
  end

  module SubClass1

    def sexp
       name.sexp
    end
  end

  module SubClass2
    def sexp
        nil
    end
  end

  def _nt_sub_class
    start_index = index
    if node_cache[:sub_class].has_key?(index)
      cached = node_cache[:sub_class][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    i1, s1 = index, []
    r3 = _nt_space
    if r3
      r2 = r3
    else
      r2 = SyntaxNode.new(input, index...index)
    end
    s1 << r2
    if r2
      if input.index('<', index) == index
        r4 = (SyntaxNode).new(input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure('<')
        r4 = nil
      end
      s1 << r4
      if r4
        r5 = _nt_space
        s1 << r5
        if r5
          r6 = _nt_module_name
          s1 << r6
        end
      end
    end
    if s1.last
      r1 = (SyntaxNode).new(input, i1...index, s1)
      r1.extend(SubClass0)
      r1.extend(SubClass1)
    else
      self.index = i1
      r1 = nil
    end
    if r1
      r0 = r1
    else
      s7, i7 = [], index
      loop do
        r8 = _nt_space
        if r8
          s7 << r8
        else
          break
        end
      end
      r7 = SyntaxNode.new(input, i7...index, s7)
      r7.extend(SubClass2)
      if r7
        r0 = r7
      else
        self.index = i0
        r0 = nil
      end
    end

    node_cache[:sub_class][start_index] = r0

    return r0
  end

  module OpenModule0
    def space
      elements[1]
    end

    def module_name
      elements[2]
    end

    def module_body
      elements[3]
    end

    def end_keyword
      elements[5]
    end
  end

  module OpenModule1
    def sexp 
       name = module_name.sexp
       name = name.last if name.first == :const
       [:module, name, module_body.sexp]
    end
  end

  def _nt_open_module
    start_index = index
    if node_cache[:open_module].has_key?(index)
      cached = node_cache[:open_module][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index('module', index) == index
      r1 = (SyntaxNode).new(input, index...(index + 6))
      @index += 6
    else
      terminal_parse_failure('module')
      r1 = nil
    end
    s0 << r1
    if r1
      r2 = _nt_space
      s0 << r2
      if r2
        r3 = _nt_module_name
        s0 << r3
        if r3
          r4 = _nt_module_body
          s0 << r4
          if r4
            r6 = _nt_space_nl
            if r6
              r5 = r6
            else
              r5 = SyntaxNode.new(input, index...index)
            end
            s0 << r5
            if r5
              r7 = _nt_end_keyword
              s0 << r7
            end
          end
        end
      end
    end
    if s0.last
      r0 = (SyntaxNode).new(input, i0...index, s0)
      r0.extend(OpenModule0)
      r0.extend(OpenModule1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:open_module][start_index] = r0

    return r0
  end

  def _nt_module_name
    start_index = index
    if node_cache[:module_name].has_key?(index)
      cached = node_cache[:module_name][index]
      @index = cached.interval.end if cached
      return cached
    end

    r0 = _nt_constant

    node_cache[:module_name][start_index] = r0

    return r0
  end

  module ModuleBody0

    def sexp
      [:scope]
    end
  end

  def _nt_module_body
    start_index = index
    if node_cache[:module_body].has_key?(index)
      cached = node_cache[:module_body][index]
      @index = cached.interval.end if cached
      return cached
    end

    r0 = _nt_space_nl
    r0.extend(ModuleBody0)

    node_cache[:module_body][start_index] = r0

    return r0
  end

  def _nt_space
    start_index = index
    if node_cache[:space].has_key?(index)
      cached = node_cache[:space][index]
      @index = cached.interval.end if cached
      return cached
    end

    s0, i0 = [], index
    loop do
      if input.index(Regexp.new('[ \\t]'), index) == index
        r1 = (SyntaxNode).new(input, index...(index + 1))
        @index += 1
      else
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      self.index = i0
      r0 = nil
    else
      r0 = SyntaxNode.new(input, i0...index, s0)
    end

    node_cache[:space][start_index] = r0

    return r0
  end

  def _nt_space_nl
    start_index = index
    if node_cache[:space_nl].has_key?(index)
      cached = node_cache[:space_nl][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    r1 = _nt_space
    if r1
      r0 = r1
    else
      r2 = _nt_new_line
      if r2
        r0 = r2
      else
        self.index = i0
        r0 = nil
      end
    end

    node_cache[:space_nl][start_index] = r0

    return r0
  end

  def _nt_new_line
    start_index = index
    if node_cache[:new_line].has_key?(index)
      cached = node_cache[:new_line][index]
      @index = cached.interval.end if cached
      return cached
    end

    s0, i0 = [], index
    loop do
      if input.index(Regexp.new('[\\n\\r;]'), index) == index
        r1 = (SyntaxNode).new(input, index...(index + 1))
        @index += 1
      else
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      self.index = i0
      r0 = nil
    else
      r0 = SyntaxNode.new(input, i0...index, s0)
    end

    node_cache[:new_line][start_index] = r0

    return r0
  end

end

class RedLeaf::Ruby::ProgramParser < Treetop::Runtime::CompiledParser
  include RedLeaf::Ruby::Program
end


