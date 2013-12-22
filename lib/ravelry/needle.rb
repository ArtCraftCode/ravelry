require_relative 'data'

module Ravelry

  # The information used to create `Ravelry::Needle` currently comes from {Ravelry::Pattern} objects.
  # 
  # See {Ravelry::Pattern} for more information about `Pattern` objects.
  # 
  # This class will be updated in future to perform GET, POST, PUT, and DESTROY requests.
  # 
  class Needle < Data
  end
end