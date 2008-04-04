module RedLeaf::Ruby::Literals
  include Treetop::Runtime

  def root
    @root || :literal
  end

  def _nt_literal
    start_index = index
    if node_cache[:literal].has_key?(index)
      cached = node_cache[:literal][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    r1 = _nt_literal_nil
    if r1
      r0 = r1
    else
      r2 = _nt_literal_true
      if r2
        r0 = r2
      else
        r3 = _nt_literal_false
        if r3
          r0 = r3
        else
          r4 = _nt_literal_symbol
          if r4
            r0 = r4
          else
            r5 = _nt_literal_string
            if r5
              r0 = r5
            else
              r6 = _nt_literal_float
              if r6
                r0 = r6
              else
                r7 = _nt_literal_long
                if r7
                  r0 = r7
                else
                  r8 = _nt_constant
                  if r8
                    r0 = r8
                  else
                    r9 = _nt_nth_ref
                    if r9
                      r0 = r9
                    else
                      r10 = _nt_global_var
                      if r10
                        r0 = r10
                      else
                        self.index = i0
                        r0 = nil
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end

    node_cache[:literal][start_index] = r0

    return r0
  end

  module LiteralNil0
    def sexp
      [:nil]
    end
  end

  def _nt_literal_nil
    start_index = index
    if node_cache[:literal_nil].has_key?(index)
      cached = node_cache[:literal_nil][index]
      @index = cached.interval.end if cached
      return cached
    end

    if input.index('nil', index) == index
      r0 = (SyntaxNode).new(input, index...(index + 3))
      r0.extend(LiteralNil0)
      @index += 3
    else
      terminal_parse_failure('nil')
      r0 = nil
    end

    node_cache[:literal_nil][start_index] = r0

    return r0
  end

  module LiteralTrue0
    def sexp
      [:true]
    end
  end

  def _nt_literal_true
    start_index = index
    if node_cache[:literal_true].has_key?(index)
      cached = node_cache[:literal_true][index]
      @index = cached.interval.end if cached
      return cached
    end

    if input.index('true', index) == index
      r0 = (SyntaxNode).new(input, index...(index + 4))
      r0.extend(LiteralTrue0)
      @index += 4
    else
      terminal_parse_failure('true')
      r0 = nil
    end

    node_cache[:literal_true][start_index] = r0

    return r0
  end

  module LiteralFalse0
    def sexp
      [:false]
    end
  end

  def _nt_literal_false
    start_index = index
    if node_cache[:literal_false].has_key?(index)
      cached = node_cache[:literal_false][index]
      @index = cached.interval.end if cached
      return cached
    end

    if input.index('false', index) == index
      r0 = (SyntaxNode).new(input, index...(index + 5))
      r0.extend(LiteralFalse0)
      @index += 5
    else
      terminal_parse_failure('false')
      r0 = nil
    end

    node_cache[:literal_false][start_index] = r0

    return r0
  end

  module LiteralFloat0
  end

  module LiteralFloat1
  end

  module LiteralFloat2

    def sexp
      [:lit, text_value.to_f]
    end
  end

  def _nt_literal_float
    start_index = index
    if node_cache[:literal_float].has_key?(index)
      cached = node_cache[:literal_float][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index(Regexp.new('[+-]'), index) == index
      r2 = (SyntaxNode).new(input, index...(index + 1))
      @index += 1
    else
      r2 = nil
    end
    if r2
      r1 = r2
    else
      r1 = SyntaxNode.new(input, index...index)
    end
    s0 << r1
    if r1
      s3, i3 = [], index
      loop do
        if input.index(Regexp.new('[0-9]'), index) == index
          r4 = (SyntaxNode).new(input, index...(index + 1))
          @index += 1
        else
          r4 = nil
        end
        if r4
          s3 << r4
        else
          break
        end
      end
      if s3.empty?
        self.index = i3
        r3 = nil
      else
        r3 = SyntaxNode.new(input, i3...index, s3)
      end
      s0 << r3
      if r3
        if input.index('.', index) == index
          r5 = (SyntaxNode).new(input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('.')
          r5 = nil
        end
        s0 << r5
        if r5
          s6, i6 = [], index
          loop do
            if input.index(Regexp.new('[0-9]'), index) == index
              r7 = (SyntaxNode).new(input, index...(index + 1))
              @index += 1
            else
              r7 = nil
            end
            if r7
              s6 << r7
            else
              break
            end
          end
          if s6.empty?
            self.index = i6
            r6 = nil
          else
            r6 = SyntaxNode.new(input, i6...index, s6)
          end
          s0 << r6
          if r6
            i9, s9 = index, []
            if input.index(Regexp.new('[eE]'), index) == index
              r10 = (SyntaxNode).new(input, index...(index + 1))
              @index += 1
            else
              r10 = nil
            end
            s9 << r10
            if r10
              if input.index(Regexp.new('[+-]'), index) == index
                r12 = (SyntaxNode).new(input, index...(index + 1))
                @index += 1
              else
                r12 = nil
              end
              if r12
                r11 = r12
              else
                r11 = SyntaxNode.new(input, index...index)
              end
              s9 << r11
              if r11
                s13, i13 = [], index
                loop do
                  if input.index(Regexp.new('[0-9]'), index) == index
                    r14 = (SyntaxNode).new(input, index...(index + 1))
                    @index += 1
                  else
                    r14 = nil
                  end
                  if r14
                    s13 << r14
                  else
                    break
                  end
                end
                if s13.empty?
                  self.index = i13
                  r13 = nil
                else
                  r13 = SyntaxNode.new(input, i13...index, s13)
                end
                s9 << r13
              end
            end
            if s9.last
              r9 = (SyntaxNode).new(input, i9...index, s9)
              r9.extend(LiteralFloat0)
            else
              self.index = i9
              r9 = nil
            end
            if r9
              r8 = r9
            else
              r8 = SyntaxNode.new(input, index...index)
            end
            s0 << r8
          end
        end
      end
    end
    if s0.last
      r0 = (SyntaxNode).new(input, i0...index, s0)
      r0.extend(LiteralFloat1)
      r0.extend(LiteralFloat2)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:literal_float][start_index] = r0

    return r0
  end

  module LiteralLong0
  end

  module LiteralLong1
    def sexp
      [:lit, text_value.to_i]
    end
  end

  def _nt_literal_long
    start_index = index
    if node_cache[:literal_long].has_key?(index)
      cached = node_cache[:literal_long][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index(Regexp.new('[+-]'), index) == index
      r2 = (SyntaxNode).new(input, index...(index + 1))
      @index += 1
    else
      r2 = nil
    end
    if r2
      r1 = r2
    else
      r1 = SyntaxNode.new(input, index...index)
    end
    s0 << r1
    if r1
      s3, i3 = [], index
      loop do
        if input.index(Regexp.new('[0-9]'), index) == index
          r4 = (SyntaxNode).new(input, index...(index + 1))
          @index += 1
        else
          r4 = nil
        end
        if r4
          s3 << r4
        else
          break
        end
      end
      if s3.empty?
        self.index = i3
        r3 = nil
      else
        r3 = SyntaxNode.new(input, i3...index, s3)
      end
      s0 << r3
    end
    if s0.last
      r0 = (SyntaxNode).new(input, i0...index, s0)
      r0.extend(LiteralLong0)
      r0.extend(LiteralLong1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:literal_long][start_index] = r0

    return r0
  end

  module LiteralSymbol0
    def name
      elements[1]
    end
  end

  module LiteralSymbol1

    def sexp
      [:lit, name.text_value.intern]
    end
  end

  def _nt_literal_symbol
    start_index = index
    if node_cache[:literal_symbol].has_key?(index)
      cached = node_cache[:literal_symbol][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index(':', index) == index
      r1 = (SyntaxNode).new(input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure(':')
      r1 = nil
    end
    s0 << r1
    if r1
      r2 = _nt_ruby_name
      s0 << r2
    end
    if s0.last
      r0 = (SyntaxNode).new(input, i0...index, s0)
      r0.extend(LiteralSymbol0)
      r0.extend(LiteralSymbol1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:literal_symbol][start_index] = r0

    return r0
  end

  def _nt_ruby_name
    start_index = index
    if node_cache[:ruby_name].has_key?(index)
      cached = node_cache[:ruby_name][index]
      @index = cached.interval.end if cached
      return cached
    end

    s0, i0 = [], index
    loop do
      if input.index(Regexp.new('[A-Za-z_$]'), index) == index
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

    node_cache[:ruby_name][start_index] = r0

    return r0
  end

  module RubyIdentifier0
  end

  def _nt_ruby_identifier
    start_index = index
    if node_cache[:ruby_identifier].has_key?(index)
      cached = node_cache[:ruby_identifier][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index(Regexp.new('[a-z_]'), index) == index
      r1 = (SyntaxNode).new(input, index...(index + 1))
      @index += 1
    else
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        if input.index(Regexp.new('[A-Za-z_]'), index) == index
          r3 = (SyntaxNode).new(input, index...(index + 1))
          @index += 1
        else
          r3 = nil
        end
        if r3
          s2 << r3
        else
          break
        end
      end
      if s2.empty?
        self.index = i2
        r2 = nil
      else
        r2 = SyntaxNode.new(input, i2...index, s2)
      end
      s0 << r2
    end
    if s0.last
      r0 = (SyntaxNode).new(input, i0...index, s0)
      r0.extend(RubyIdentifier0)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:ruby_identifier][start_index] = r0

    return r0
  end

  module LiteralString0
    def content
      elements[1]
    end

  end

  module LiteralString1

    def sexp
      [:str, content.text_value]
    end
  end

  def _nt_literal_string
    start_index = index
    if node_cache[:literal_string].has_key?(index)
      cached = node_cache[:literal_string][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index(Regexp.new('[\\\'\\"]'), index) == index
      r1 = (SyntaxNode).new(input, index...(index + 1))
      @index += 1
    else
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        if input.index(Regexp.new('[^\\\'\\"]'), index) == index
          r3 = (SyntaxNode).new(input, index...(index + 1))
          @index += 1
        else
          r3 = nil
        end
        if r3
          s2 << r3
        else
          break
        end
      end
      if s2.empty?
        self.index = i2
        r2 = nil
      else
        r2 = SyntaxNode.new(input, i2...index, s2)
      end
      s0 << r2
      if r2
        if input.index(Regexp.new('[\\\'\\"]'), index) == index
          r4 = (SyntaxNode).new(input, index...(index + 1))
          @index += 1
        else
          r4 = nil
        end
        s0 << r4
      end
    end
    if s0.last
      r0 = (SyntaxNode).new(input, i0...index, s0)
      r0.extend(LiteralString0)
      r0.extend(LiteralString1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:literal_string][start_index] = r0

    return r0
  end

  module Constant0
  end

  module Constant1
    def sexp 
      [:const, text_value.intern]
    end
  end

  def _nt_constant
    start_index = index
    if node_cache[:constant].has_key?(index)
      cached = node_cache[:constant][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index(Regexp.new('[A-Z]'), index) == index
      r1 = (SyntaxNode).new(input, index...(index + 1))
      @index += 1
    else
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        if input.index(Regexp.new('[A-Za-z0-9_]'), index) == index
          r3 = (SyntaxNode).new(input, index...(index + 1))
          @index += 1
        else
          r3 = nil
        end
        if r3
          s2 << r3
        else
          break
        end
      end
      r2 = SyntaxNode.new(input, i2...index, s2)
      s0 << r2
    end
    if s0.last
      r0 = (SyntaxNode).new(input, i0...index, s0)
      r0.extend(Constant0)
      r0.extend(Constant1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:constant][start_index] = r0

    return r0
  end

  module NthRef0
    def nth
      elements[1]
    end
  end

  module NthRef1

    def sexp
      [:nth_ref, nth.text_value.to_i]
    end
  end

  def _nt_nth_ref
    start_index = index
    if node_cache[:nth_ref].has_key?(index)
      cached = node_cache[:nth_ref][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index('$', index) == index
      r1 = (SyntaxNode).new(input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('$')
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        if input.index(Regexp.new('[0-9]'), index) == index
          r3 = (SyntaxNode).new(input, index...(index + 1))
          @index += 1
        else
          r3 = nil
        end
        if r3
          s2 << r3
        else
          break
        end
      end
      if s2.empty?
        self.index = i2
        r2 = nil
      else
        r2 = SyntaxNode.new(input, i2...index, s2)
      end
      s0 << r2
    end
    if s0.last
      r0 = (SyntaxNode).new(input, i0...index, s0)
      r0.extend(NthRef0)
      r0.extend(NthRef1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:nth_ref][start_index] = r0

    return r0
  end

  module GlobalVar0
  end

  module GlobalVar1

    def sexp
      [:gvar, text_value.intern]
    end
  end

  def _nt_global_var
    start_index = index
    if node_cache[:global_var].has_key?(index)
      cached = node_cache[:global_var][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index('$', index) == index
      r1 = (SyntaxNode).new(input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('$')
      r1 = nil
    end
    s0 << r1
    if r1
      if input.index(Regexp.new('[a-zA-Z_]'), index) == index
        r2 = (SyntaxNode).new(input, index...(index + 1))
        @index += 1
      else
        r2 = nil
      end
      s0 << r2
      if r2
        s3, i3 = [], index
        loop do
          if input.index(Regexp.new('[a-zA-Z0-9_]'), index) == index
            r4 = (SyntaxNode).new(input, index...(index + 1))
            @index += 1
          else
            r4 = nil
          end
          if r4
            s3 << r4
          else
            break
          end
        end
        if s3.empty?
          self.index = i3
          r3 = nil
        else
          r3 = SyntaxNode.new(input, i3...index, s3)
        end
        s0 << r3
      end
    end
    if s0.last
      r0 = (SyntaxNode).new(input, i0...index, s0)
      r0.extend(GlobalVar0)
      r0.extend(GlobalVar1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:global_var][start_index] = r0

    return r0
  end

end

class RedLeaf::Ruby::LiteralsParser < Treetop::Runtime::CompiledParser
  include RedLeaf::Ruby::Literals
end


