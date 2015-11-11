require_relative 'request_helpers/needles_helpers'

module RequestHelpers
  # Helpers that stub API requests

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
