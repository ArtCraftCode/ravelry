module Ravelry

  #  The information used to create `Ravelry::YarnWeight` currently comes from {Ravelry::Pattern} objects.
  # 
  # See {Ravelry::Pattern} for more information about `Pattern` objects.
  # 
  # This class will be updated in future to perform GET, POST, PUT, and DESTROY requests.
  # 
  class YarnWeight < Data

      # Gets yarn weight's name from existing `data`.
      def name
        data[:name]
      end

      # Gets yarn weight's min_gauge from existing `data`.
      def min_gauge
        data[:min_gauge]
      end

      # Gets yarn weight's wpi from existing `data`.
      def wpi
        data[:wpi]
      end

      # Gets yarn weight's crochet_gauge from existing `data`.
      def crochet_gauge
        data[:crochet_gauge]
      end

      # Gets yarn weight's ply from existing `data`.
      def ply
        data[:ply]
      end

      # Gets yarn weight's knit_gauge from existing `data`.
      def knit_gauge
        data[:knit_gauge]
      end

      # Gets yarn weight's max_gauge from existing `data`.
      def max_gauge
        data[:max_gauge]
      end

    # Handles API call and parses JSON response. 
    def fetch_and_parse
      # TODO
    end
  end

end
