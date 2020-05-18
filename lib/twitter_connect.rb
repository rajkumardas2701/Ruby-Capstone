# require_relative '../bin/main.rb'
require 'twitter'

class TwitterConnect
  def initialize(con_key = nil, con_sec = nil, acc_token = nil, acc_secret = nil)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = con_key
      config.consumer_secret = con_sec
      config.access_token = acc_token
      config.access_token_secret = acc_secret
      puts 'values set in twitter Connect'
    end
    # bug_quotes = %w[Hi_manish Hello_Raj Test_Pooja Test_again_Pooja]
    #   4.times {
    #     @client.update(bug_quotes.sample)
    #     sleep(10)
    #   }
  end

  # but_quotes = %w[Hi Hello Test Test_again]
end
