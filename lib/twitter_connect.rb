require 'twitter'

class TwitterConnect
  def initialize(con_key = nil, con_sec = nil, acc_token = nil, acc_secret = nil)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = con_key
      config.consumer_secret = con_sec
      config.access_token = acc_token
      config.access_token_secret = acc_secret
    end
    @a = []
    @follower_list_new = []
    @new_follower = ''
    @user_timeline = []
  end

  def tweet(post = nil, time = nil)
    @client.update(post)
    sleep(time)
  end

  def follow_user(someone = nil)
    @client.follow(someone)
    timeline_content(someone)
  end

  def user_timeline(someone = nil)
    @client.user_timeline(someone)
  end

  def timeline_content(someone = nil)
    i = 0
    count = 0
    user_timeline(someone).each do |tweet|
      @a[i] = [tweet.full_text, tweet.user, tweet.user.name,
               tweet.user.location,
               tweet.user.followers_count]
      i += 1
    end
    while count < @a.length
      @a[count].each do |x|
        @user_timeline.push(x.to_s)
      end
      count += 1
    end
    @user_timeline
  end
end

# tweet = TwitterConnect.new
