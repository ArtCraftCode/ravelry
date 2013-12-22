module Ravelry

  #  The information used to create `Ravelry::Yarn` currently comes from {Ravelry::Pattern} objects.
  # 
  # See {Ravelry::Pattern} for more information about `Pattern` objects.
  # 
  # This class will be updated in future to perform GET, POST, PUT, and DESTROY requests.
  # 
  class Yarn
    attr_accessor :id
    attr_reader :data

    def initialize(id=nil, data=nil)
      @id = id
      @data = data if data
      @data = fetch_and_parse if fetch_api?
    end

    def permalink
      data[:permalink]
    end

    def company
      data[:yarn_company_name]
    end

    def name
      data[:name]
    end

    def company_id
      data[:yarn_company_id]
    end

    private
    # Determines if an API fetch needs to be made.
    def fetch_api?
      @id && !@data
    end

    # Handles API call and parses JSON response. 
    def fetch_and_parse
      # TODO
    end
  end

end
