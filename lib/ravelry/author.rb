module Ravelry

  # There is no API access point for PatternAuthors. The information used to create `Ravelry::Author` comes from {Ravelry::Pattern} objects.
  # 
  # You should not create `Author` objects manually; they are all created–and owned by–by a {Ravelry::Pattern}.
  # 
  # See {Ravelry::Pattern} for more information about `Pattern` objects.
  # 
  # This does not inherit from {Ravelry::Data} because it doesn't have a corresponding API endpoint.
  # 
  class Author
    attr_reader :id, :name, :permalink, :patterns_count, :favorites_count

    # Creates new `Author` from Ravelry API PatternAuthor attributes.
    # 
    # All class variables are readonly.
    # 
    def initialize(pattern_author)
      @id = pattern_author[:id]
      @name = pattern_author[:name]
      @permalink = pattern_author[:permalink]
      @patterns_count = pattern_author[:patterns_count]
      @favorites_count = pattern_author[:favorites_count]
    end
  end

end
