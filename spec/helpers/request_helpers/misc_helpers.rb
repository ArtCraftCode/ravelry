module RequestHelpers
  # Helpers that stub out requests to misc endpoints

  def stub_color_families
    stub_request_with_fixture(
      %r{/color_families\.json},
      'color_families.json'
    )
  end

  def stub_yarn_weights
    stub_request_with_fixture(
      %r{/yarn_weights\.json},
      'yarn_weights.json'
    )
  end
end
