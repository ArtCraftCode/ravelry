require_relative 'data'

module Ravelry

  #  The information used to create `Ravelry::Yarn` currently comes from {Ravelry::Pattern} objects.
  # 
  # See {Ravelry::Pattern} for more information about `Pattern` objects.
  # 
  # This class will be updated in future to perform GET, POST, PUT, and DESTROY requests.
  # 
  class Yarn < Data
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

    # Handles API call and parses JSON response. 
    def fetch_and_parse
      # TODO
    end
  end

end
