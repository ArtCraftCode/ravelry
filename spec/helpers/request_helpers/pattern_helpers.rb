module RequestHelpers
  # Helpers that stub out requests to pattern endpoints

  def stub_patterns_show_paid
    stub_request_with_fixture(
      %r{/patterns/[0-9]+\.json},
      'patterns_show_paid.json'
    )
  end

  def stub_patterns_search
    stub_request_with_fixture(
      %r{/patterns/search.json},
      'patterns_search.json'
    )
  end
end
