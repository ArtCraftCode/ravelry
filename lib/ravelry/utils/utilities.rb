module Ravelry

  # Utility module that handles date, string, and number parsing.
  #
  module Utilities

    # Expects a format readable by Ruby's Date library.
    #
    def self.pretty_full_date(string)
      parsed = Date.parse(string)
      parsed.strftime("%B %e, %Y")
    end
  end
end