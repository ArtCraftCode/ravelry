require_relative '../spec_helper'

describe Ravelry::Authentication do
  it 'works' do
    Ravelry::Authentication.new("http://www.ravelry.com")
  end
end