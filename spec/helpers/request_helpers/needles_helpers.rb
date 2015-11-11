module RequestHelpers
  # Helpers that stub out requests to needles endpoints

  def stub_needles_sizes
    response = fixture_response('needles_sizes.json')
    Typhoeus.stub(%r{/needles/sizes\.json}).and_return(response)
  end

  def stub_needles_types
    response = fixture_response('needles_types.json')
    Typhoeus.stub(%r{/needles/types\.json}).and_return(response)
  end

  def stub_needles_list
    response = fixture_response('needles_list.json')
    Typhoeus.stub(%r{/people/[^/]+/needles/list\.json}).and_return(response)
  end
end
