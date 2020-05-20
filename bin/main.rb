#!/usr/bin/env ruby
require_relative '../lib/corona'
require_relative '../lib/festivals'
require_relative '../lib/twitter_connect'
require_relative '../lib/jobs'

puts 'Please enter below details to connect with your twitter Bot'
puts 'Enter your consumer key:'
con_key = gets.chomp
puts 'Enter your consumer secret:'
con_sec = gets.chomp
puts 'Enter your access token:'
acc_token = gets.chomp
puts 'Enter your access token secret:'
acc_secret = gets.chomp

twitter_con = TwitterConnect.new(con_key, con_sec, acc_token, acc_secret)
corona = Corona.new
fest = Festival.new
job = Jobs.new

puts 'Please enter Twitter name of someone you would like to follow and fetch their Timeline'
puts "If you don't want to follow anyone now, say 'N'"
someone = gets.chomp

if someone == 'N'
else
  p twitter_con.follow_user(someone)
end

loop do
  twitter_con.catch_new_follower
  twitter_con.tweet("Corona Cases in India #{corona.date}
  Active: #{corona.active}
  Discharged: #{corona.discharge}
  Death: #{corona.death}
  Migrated: #{corona.migrated}", 10)

  twitter_con.tweet("We have #{fest.count_festivals} festivals in #{fest.current_month} which falls on
  #{fest.days_of_fest}", 10)

  job.fetch_job
  twitter_con.tweet("Job Vacancy in Bangalore,
  Company: #{job.company}
  Postion/Qualification: #{job.position}
  Apply clicking on link below: #{job.url}", 10)

  twitter_con.catch_new_follower
  sleep(10)
end
