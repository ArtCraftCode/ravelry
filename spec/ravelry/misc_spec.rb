require_relative '../spec_helper'

describe Ravelry::Misc do
  context '#color_families' do
    before do
      stub_color_families
    end

    it 'should return an array of color families' do
      result = Ravelry::Misc.color_families
      expect(result.first).to be_instance_of(Ravelry::ColorFamily)
    end
  end

  context '#yarn_weights' do
    before do
      stub_yarn_weights
    end

    it 'should return an array of color families' do
      result = Ravelry::Misc.yarn_weights
      expect(result.first).to be_instance_of(Ravelry::YarnWeight)
    end
  end

  context '#current_user' do
    before do
      @user = Ravelry::Misc.current_user
    end

    it 'should return a user' do
      expect(@user).to be_instance_of(Ravelry::User)
    end

    it 'should be missing #about_me' do
      expect(@user.about_me).to be_nil
    end

    it 'should have photos' do
      expect(@user.photo_url).to be
      expect(@user.small_photo_url).to be
      expect(@user.tiny_photo_url).to be
      expect(@user.large_photo_url).to be
    end

    it 'should have an id' do
      expect(@user.id).to be
    end

    it 'should have a username' do
      expect(@user.username).to be
    end
  end
end
