module PatternsHelpers

  # Helpers for Ravelry::Patterns

  def initialize_paid
    # Volatile Magic Shawl
    Ravelry::Patterns.new("419443")
  end

  def initialize_free; end
end