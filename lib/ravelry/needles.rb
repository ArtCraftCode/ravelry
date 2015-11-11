module Ravelry

  # Handles API request for the `Needles` endpoints. Always returns an array of {Ravelry::Needle} objects.
  # 
  module Needles
    extend self

    # Get available sizes for each needle type. If you don't pass an argument, you'll get all knitting needle and crochet hook sizes.
    # 
    # If you pass an argument (`'knitting'` or `'crochet'`), you will only get results that match that type.
    # 
    # Arguments: needle type (string, optional)
    # 
    def sizes(craft='')
      result = Utils::Request.get("needles/sizes.json?craft=#{craft}", :needle_sizes)
      result.data.map { |needle| Needle.new(needle) }
    end

    # Get needle types.
    # 
    def types
      result = Utils::Request.get("needles/types.json", :needle_types)
      result.data.map { |needle| Needle.new(needle) }
    end

    # Get needle records for an individual user.
    # 
    # Arguments: username (string, required)
    # 
    def list(username)
      result = Utils::Request.get("people/#{username}/needles/list.json", :needle_records)
      result.data.map { |needle| Needle.new(needle) }
    end
  end
end