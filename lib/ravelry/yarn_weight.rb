require_relative 'data'

module Ravelry

  #  The information used to create `Ravelry::YarnWeight` currently comes from {Ravelry::Pattern} objects.
  # 
  # See {Ravelry::Pattern} for more information about `Pattern` objects.
  # 
  # This class will be updated in future to perform GET, POST, PUT, and DESTROY requests.
  # 
  class YarnWeight < Data

      def name
        data[:name]
      end

      def min_gauge
        data[:min_gauge]
      end

      def wpi
        data[:wpi]
      end

      def crochet_gauge
        data[:crochet_gauge]
      end

      def ply
        data[:ply]
      end

      def knit_gauge
        data[:knit_gauge]
      end

      def max_gauge
        data[:max_gauge]
      end

    # Handles API call and parses JSON response. 
    def fetch_and_parse
      # TODO
    end
  end

end
