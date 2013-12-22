module Ravelry

  # The information used to create `Ravelry::Category` currently comes from {Ravelry::Pattern} objects.
  # 
  # See {Ravelry::Pattern} for more information about `Pattern` objects.
  # 
  # This class will be updated in future to perform GET, POST, PUT, and DESTROY requests.
  # 
  class Category < Data
    attr_reader :parent_name, :parent_permalink, :grandparent_name, :grandparent_permalink, :greatgrandparent_name, :greatgrandparent_permalink

    # Gets name from existing `data`.
    def name
      data[:name]
    end

    # Gets permalink from existing `data`.
    def permalink
      data[:permalink]
    end

    # Returns parent name and sets parent attributes from existing `data`.
    def parent
      if data[:parent]
        @parent_permalink = data[:parent][:permalink]
        @parent_name = data[:parent][:name]
      end
    end

    # Returns parent name and sets grandparent attributes from existing `data`.
    def grandparent
      if data[:parent][:parent]
        @grandparent_permalink = data[:parent][:parent][:permalink]
        @grandparent_name = data[:parent][:parent][:name]
      end
    end

    # Returns parent name and sets greatgrandparent attributes from existing `data`.
    def greatgrantparent
      if data[:parent][:parent][:parent]
        @greatgrandparent_permalink = data[:parent][:parent][:parent][:permalink]
        @greatgrandparent_name = data[:parent][:parent][:parent][:name]
      end
    end
  end
end