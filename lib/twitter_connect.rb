# require_relative 'corona'
require 'twitter'

class TwitterConnect
  def initialize(con_key = nil, con_sec = nil, acc_token = nil, acc_secret = nil)
    @client = Twitter::REST::Client.new do |config|
      # config.consumer_key = con_key
      # config.consumer_secret = con_sec
      # config.access_token = acc_token
      # config.access_token_secret = acc_secret

      config.consumer_key = 'F8H5rsBLFW8qrO8bLju3hb4E0'
      config.consumer_secret = 'f0eNLKfsttK7xdQQxrUdzIifQGIgCrxJtYby821BvzcL1Vy8J8'
      config.access_token = '1223066921907548166-xa2tRRifvw4QsOv2Muq4gHpYeIS1uz'
      config.access_token_secret = 't9iFrfXspILtUsxe6VWKOyNoHok7WWo6AlTuFmQYeWC2u'
      # puts 'values set in twitter Connect'
    end
    # bug_quotes = %w[Hi_manish Hello_Raj Test_Pooja Test_again_Pooja]
    #   4.times {
    #     @client.update(bug_quotes.sample)
    #     sleep(10)
    # }
  end

  def tweet(post, time)
    @client.update(post)
    sleep(time)
  end
end
