module Ravelry

  # The API endpoint for fetching `Needle` objects can be found in {Ravelry::Needles}.
  #
  # A `Needle` object can be created by several different endpoints but is currently only implemented in {Ravelry::Misc}.
  #
  class Needle
    attr_reader :id, :metric, :metric_name, :hook, :name, :pretty_metric, :us, :description, :length, :needle_size_id, :type_name
    def intialize(data)
      @id = data[:id]
      # Crochet hook size.
      #
      @hook = data[:hook]
      # US size for knitting needles (Integer or Float).
      #
      @us = data[:us]
      # Combination of US and metric.
      # Example: "US 4  - 3.5 mm"
      #
      @name = data[:name]
      # Metric size for knitting needles (Integer or Float).
      #
      @metric = data[:metric] || data[:metric_name]
      # Metric size for knitting needles (Integer or Float).
      #
      @metric_name = data[:metric_name] || data[:metric]
      # Metric size for knitting needles (pretty format).
      #
      @pretty_metric = data[:pretty_metric]

      @description = data[:description]
      @length = data[:length]
      @needle_size_id = data[:needle_size_id]
      @type_name = data[:type_name]
    end

    # Takes the US size and turns it into a string.
    # Example: "US 4"
    #
    def us_string
      "US #{@us}".strip
    end

    # Takes the metric size and turns it into a string.
    # Example: "3.5 mm"
    #
    def metric_string
      "#{@metric} mm"
    end
  end
end