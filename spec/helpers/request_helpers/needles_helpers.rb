module RequestHelpers
  # Helpers that stub out requests to needles endpoints

  def stub_needles_sizes
    stub_request_with_fixture(
      %r{/needles/sizes\.json},
      'needles_sizes.json'
    )
  end

  def stub_needles_types
    stub_request_with_fixture(
      %r{/needles/types\.json},
      'needles_types.json'
    )
  end

  def stub_needles_list
    stub_request_with_fixture(
      %r{/people/[^/]+/needles/list\.json},
      'needles_list.json'
    )
  end
end
