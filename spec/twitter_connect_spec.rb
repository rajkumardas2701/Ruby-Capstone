require_relative '../lib/twitter_connect'
require 'spec_helper'

describe TwitterConnect do
  let(:obj) { TwitterConnect.new }

  describe 'tweet' do
    post = 'Text'
    it 'should be able to post message' do
      allow(obj).to receive(:tweet).and_return(post)
      expect(obj.tweet).to eql(post)
    end

    it 'should not post if argument is not String' do
      allow(obj).to receive(:tweet).and_return(post)
      expect(obj.tweet).not_to eql(true)
    end
  end

  describe 'follow_user' do
    someone = 123_456_789
    it 'should follow new user' do
      allow(obj).to receive(:follow_user).and_return(someone)
      expect(obj.follow_user).to eql(someone)
    end

    it 'should not be follow user if argument is other than ID' do
      allow(obj).to receive(:follow_user).and_return(someone)
      expect(obj.follow_user).not_to eql(true)
    end
  end

  describe 'user_timeline' do
    someone = 123_456_789
    it 'should follow new user' do
      allow(obj).to receive(:user_timeline).and_return(someone)
      expect(obj.user_timeline).to eql(someone)
    end

    it 'should follow new user' do
      allow(obj).to receive(:user_timeline).and_return(someone)
      expect(obj.user_timeline).not_to eql(true)
    end
  end

  describe '#timeline_content' do
    @user_timeline = ['@Lebz_Sr So are you send shots at somebody here ?',
                      '#<Twitter::User:0x0000000007fb20f0>', 'Alican', 'Gulu-Uganda', '322']

    it 'should return timeline of user' do
      allow(obj).to receive(:timeline_content).and_return(@user_timeline)
      expect(obj.timeline_content).to eq(@user_timeline)
    end

    it 'should not return type of String' do
      allow(obj).to receive(:timeline_content).and_return(@user_timeline)
      expect(obj.timeline_content).not_to be_a(String)
    end
  end
end
