module RedLeaf::Ruby::Keywords
  include Treetop::Runtime

  def root
    @root || :end_keyword
  end

  def _nt_end_keyword
    start_index = index
    if node_cache[:end_keyword].has_key?(index)
      cached = node_cache[:end_keyword][index]
      @index = cached.interval.end if cached
      return cached
    end

    if input.index('end', index) == index
      r0 = (SyntaxNode).new(input, index...(index + 3))
      @index += 3
    else
      terminal_parse_failure('end')
      r0 = nil
    end

    node_cache[:end_keyword][start_index] = r0

    return r0
  end

end

class RedLeaf::Ruby::KeywordsParser < Treetop::Runtime::CompiledParser
  include RedLeaf::Ruby::Keywords
end

