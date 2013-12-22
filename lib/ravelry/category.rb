module Ravelry

  # There is no API access point for PatternCategories. The information used to create `Ravelry::Category` comes from {Ravelry::Pattern} objects.
  # 
  # You should not need to create `Category` objects manually; they are all created–and owned by–by a {Ravelry::Pattern}.
  # 
  # See {Ravelry::Pattern} for more information about `Pattern` objects.
  # 
  # This does not inherit from {Ravelry::Data} because it doesn't have a corresponding API endpoint.
  # 
  class Category
    attr_reader :name, :permalink, :parent_name, :parent_permalink, :grandparent_name, :grandparent_permalink, :greatgrandparent_name, :greatgrandparent_permalink

    # Creates new `Category` from Ravelry API PatternCategories attributes up to the great grandparent level
    # 
    # All class variables are readonly.
    # 
    def initialize(category)
      @name = category[:name]
      @permalink = category[:permalink]
      @category = category
      set_relatives
    end

    protected
    # Returns parent name and sets parent attributes from existing `data`.
    def parent
      if @category[:parent]
        @parent_permalink = @category[:parent][:permalink]
        @parent_name = @category[:parent][:name]
      end
    end

    # Returns parent name and sets grandparent attributes from existing `data`.
    def grandparent
      if @category[:parent][:parent]
        @grandparent_permalink = @category[:parent][:parent][:permalink]
        @grandparent_name = @category[:parent][:parent][:name]
      end
    end

    # Returns parent name and sets greatgrandparent attributes from existing `data`.
    def greatgrandparent
      if @category[:parent][:parent][:parent]
        @greatgrandparent_permalink = @category[:parent][:parent][:parent][:permalink]
        @greatgrandparent_name = @category[:parent][:parent][:parent][:name]
      end
    end

    private
    def set_relatives
      parent if @category[:parent]
      grandparent if @category[:parent][:parent]
      greatgrandparent if @category[:parent][:parent][:parent]
    end
  end
end