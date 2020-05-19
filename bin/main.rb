#!/usr/bin/env ruby
require_relative '../lib/corona'
require_relative '../lib/festivals'
require_relative '../lib/twitter_connect'
require_relative '../lib/jobs'

# puts 'Please enter below details to connect with your twitter Bot'
# puts 'Enter your consumer key:'
# con_key = gets.chomp
# puts 'Enter your consumer secret:'
# con_sec = gets.chomp
# puts 'Enter your access token:'
# acc_token = gets.chomp
# puts 'Enter your access token secret:'
# acc_secret = gets.chomp

twitter_con = TwitterConnect.new
# (con_key, con_sec, acc_token, acc_secret)
corona = Corona.new
fest = Festival.new
# job = Jobs.new

# puts 'Status of Corona Cases in India ' + corona.date
# puts 'Active Case: ' + corona.active
# puts 'Discharged Case: ' + corona.discharge
# puts 'Death Case: ' + corona.death
# puts 'Migrated Case: ' + corona.migrated

# fest.print_festivals

# job.print_jobs

loop do
  twitter_con.tweet("Corona Cases in India #{corona.date}
  Active: #{corona.active}
  Discharged: #{corona.discharge}
  Death: #{corona.death}
  Migrated: #{corona.migrated}", 60)

  twitter_con.tweet("We have #{fest.count_festivals} festivals in #{fest.current_month} which falls on
  #{fest.days_of_fest}", 20)


end
