require 'twitter'

class TwitterConnect
  def initialize(_con_key = nil, _con_sec = nil, _acc_token = nil, _acc_secret = nil)
    @client = Twitter::REST::Client.new do |config|
      # config.consumer_key = con_key
      # config.consumer_secret = con_sec
      # config.access_token = acc_token
      # config.access_token_secret = acc_secret
      config.consumer_key = 'MQOR25kzhKh8PObOBNIhdZ3NX'
      config.consumer_secret = 'XikzfL1Rz6OyqEkTyWuQegpLjUM3EgLXiMw0UNHsuH5yy815yD'
      config.access_token = '1223066921907548166-Jn1QtRunV86TyQf9k4wm7G4lfNLEcw'
      config.access_token_secret = 'eQASsvnajYaoidyOQpiiHQedbmkyCQNN7SyS4pWb9YyzF'
    end
    @a = []
    @followers_existing = @client.follower_ids.attrs[:ids]
    @follower_list_new = []
    @new_follower = ''
  end

  def tweet(post, time)
    @client.update(post)
    sleep(time)
  end

  def catch_new_follower
    sleep(10)
    @follower_list_new = @client.follower_ids.attrs[:ids]
    if @follower_list_new.length > @followers_existing.length
      @follower_list_new.each do |follower|
        if @followers_existing.include? follower
        else
          @new_follower = follower
          @followers_existing.push(follower)
        end
      end
    end
    message_new_follower(@new_follower) if @new_follower != ''
  end

  def follow_user(someone)
    @client.follow(someone)
    timeline_content(someone)
  end

  private

  def message_new_follower(new_follower)
    user = new_follower
    @client.create_direct_message(user, 'Hello, Thank you for following my Twitter handle.
    Stay tuned for more updates!')
    @new_follower = ''
  end

  def user_timeline(someone)
    @client.user_timeline(someone)
  end

  def timeline_content(someone)
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
        puts x.to_s
      end
      count += 1
    end
  end
end
