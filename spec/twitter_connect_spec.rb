require_relative '../lib/twitter_connect'

describe TwitterConnect do
  let(:obj) { TwitterConnect.new }
  let(:followers_existing) { obj.instance_variable_get(:@followers_existing) }
  let(:ids) { 1_234_567_891 }
  let(:follower_list_new) { obj.instance_variable_get(:@follower_list_new) }

  describe 'initialize' do
    it 'should return array of followers' do
      expect(followers_existing).to be_an(Array)
    end
  end

  describe 'tweet' do
    it 'should be able to post message without error' do
      expect { obj.tweet('tweet', 10) }.to_not raise_error
    end
  end

  describe 'catch_new_follower' do
    it 'should be able to catch and message new follower without error' do
      expect { obj.catch_new_follower }.to_not raise_error
    end
  end

  describe 'follow_user' do
    it 'should be able to follow and return timeline of the user without error' do
      expect { obj.follow_user(ids) }.to_not raise_error
    end
  end
end
