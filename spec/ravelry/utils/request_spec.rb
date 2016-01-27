require_relative '../../spec_helper'

describe Ravelry::Utils::Request do
  let(:response) { double(:response_body => '{}') }
  let(:url) { 'current_user.json' }
  let(:userpwd) do
    "#{Ravelry.configuration.access_key}:#{Ravelry.configuration.personal_key}"
  end
  let(:params) { {test: 123} }

  context '#get' do
    it 'passes in query params' do
      expect(Typhoeus::Request).to receive(:get)
        .with("https://api.ravelry.com/#{url}", userpwd: userpwd, params: params)
        .and_return(response)

      Ravelry::Utils::Request.get(url, nil, params)
    end
  end
end
