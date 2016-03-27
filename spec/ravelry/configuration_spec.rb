require_relative '../spec_helper'

describe Ravelry::Configuration do
  before do
    @callback_url = "hello panda"
    Ravelry.configure do |config|
      config.access_key = ENV['RAV_ACCESS']
      config.secret_key = ENV['RAV_SECRET']
      config.personal_key = ENV['RAV_PERSONAL']
      config.callback_url = @callback_url
    end
  end

  context 'with configuration block' do
    it 'returns the correct access_key' do
      expect(Ravelry.configuration.access_key).to eq(ENV['RAV_ACCESS'])
    end

    it 'returns the correct secret_key' do
      expect(Ravelry.configuration.secret_key).to eq(ENV['RAV_SECRET'])
    end

    it 'returns the correct personal_key' do
      expect(Ravelry.configuration.personal_key).to eq(ENV['RAV_PERSONAL'])
    end

    it 'returns the correct callback_url' do
      expect(Ravelry.configuration.callback_url).to eq(@callback_url)
    end
  end

  context 'without configuration block' do
    before do
      Ravelry.reset
    end

    it 'raises a configuration error for access_key' do
      expect { Ravelry.configuration.access_key }.to raise_error(Ravelry::Errors::Configuration)
    end

    it 'raises a configuration error for secret_key' do
      expect { Ravelry.configuration.secret_key }.to raise_error(Ravelry::Errors::Configuration)
    end

    it 'raises a configuration error for personal_key' do
      expect { Ravelry.configuration.personal_key }.to raise_error(Ravelry::Errors::Configuration)
    end

    it 'raises a configuration error for callback_url' do
      expect { Ravelry.configuration.callback_url }.to raise_error(Ravelry::Errors::Configuration)
    end
  end

  context '#reset' do
    it 'resets configured values' do
      expect(Ravelry.configuration.access_key).to eq(ENV['RAV_ACCESS'])
      expect(Ravelry.configuration.secret_key).to eq(ENV['RAV_SECRET'])
      expect(Ravelry.configuration.personal_key).to eq(ENV['RAV_PERSONAL'])
      expect(Ravelry.configuration.callback_url).to eq(@callback_url)

      Ravelry.reset
      expect { Ravelry.configuration.access_key }.to raise_error(Ravelry::Errors::Configuration)
      expect { Ravelry.configuration.secret_key }.to raise_error(Ravelry::Errors::Configuration)
      expect { Ravelry.configuration.personal_key }.to raise_error(Ravelry::Errors::Configuration)
      expect { Ravelry.configuration.callback_url }.to raise_error(Ravelry::Errors::Configuration)
    end
  end
end