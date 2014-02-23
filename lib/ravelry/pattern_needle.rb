module Ravelry

  # The information used to create `Ravelry::PatternNeedle` currently comes from {Ravelry::Pattern} objects.
  #
  # You should not need to create `PatterNeedle` objects manually; they are all created–and owned–by a {Ravelry::Pattern}.
  #
  # Note that there are other API endpoints for Needles; this might not be the one that you're looking for.
  #
  # See {Ravelry::Pattern} for more information about `Pattern` objects.
  #
  class PatternNeedle

    attr_reader :type, :hook, :us, :metric, :knitting

    def initialize(needle)
      @needle = needle
      # Crochet hook size.
      #
      @hook = needle[:hook]
      # US size for knitting needles (Integer or Float).
      #
      @us = needle[:us]
      # Metric size for knitting needles (Integer or Float).
      #
      @metric = needle[:metric]
      # Combination of US and metric.
      # Example: "US 4  - 3.5 mm"
      #
      @knitting = needle[:name]
    end

    # Sets @type to 'knitting' or 'crochet'.
    #
    def type
      @type = 'knitting' if @needle[:knitting]
      @type = 'crochet' if @needle[:crochet]
      @type
    end

    # Takes the US size and turns it into a sentence.
    # Example: "US 4"
    #
    def us_string
      "US #{@us}".strip
    end

    # Takes the metric size and turns it into a sentence.
    # Example: "3.5 mm"
    #
    def metric_string
      "#{@metric} mm"
    end
  end
end