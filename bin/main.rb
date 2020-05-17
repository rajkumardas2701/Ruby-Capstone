#!/usr/bin/env ruby
require_relative '../lib/corona'
require_relative '../lib/festivals'

corona = Corona.new
puts 'Status of Corona Cases in India ' + corona.date
puts 'Active Case: ' + corona.active
puts 'Discharge Case: ' + corona.discharge
puts 'Death Case: ' + corona.death
puts 'Migrated Case: ' + corona.migrated

fest = Festival.new
fest.print_festivals
