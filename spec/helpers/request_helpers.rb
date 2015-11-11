require_relative 'request_helpers/needles_helpers'
require_relative 'request_helpers/pattern_helpers'

module RequestHelpers
  # Helpers that stub API requests

  # Stubs a Typhoeus request with a response fixture
  #
  def stub_request_with_fixture(url_or_pattern, file)
    response = fixture_response(file)
    Typhoeus.stub(url_or_pattern).and_return(response)
  end

  # Returns a Typhoeus::Response with the given fixture as the body
  #
  def fixture_response(file)
    Typhoeus::Response.new(code: 200, body: fixture(file))
  end

  private
  def fixture(file)
    File.read(fixture_path(file))
  end

  def fixture_path(file)
    File.expand_path(
      "request_helpers/fixtures/#{file}",
      File.dirname(__FILE__)
    )
  end
end
