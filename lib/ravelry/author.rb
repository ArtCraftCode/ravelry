module Ravelry

  # There is no API access point for PatternAuthors. The information used to create Ravelry::Author comes from Ravelry::Pattern objects.
  # 
  # See {Ravelry::Pattern} for more information about `Pattern` objects.
  # 
  class Author
    attr_reader :id, :name, :permalink, :patterns_count, :favorites_count

    # Creates new `Author` from Ravelry API PatternAuthor attributes.
    def initialize(pattern_author)
      @id = pattern_author[:id]
      @name = pattern_author[:name]
      @permalink = pattern_author[:permalink]
      @patterns_count = pattern_author[:patterns_count]
      @favorites_count = pattern_author[:favorites_count]
    end
  end

end
