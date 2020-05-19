require 'nokogiri'
require 'httparty'
require 'byebug'

class Corona
  attr_reader :date, :active, :discharge, :death, :migrated

  def initialize
    url = 'https://www.mygov.in/covid-19/'
    corona_unparsed = HTTParty.get(url)
    corona_parsed = Nokogiri::HTML(corona_unparsed)
    date_info = corona_parsed.css('div.info_title')

    @date = date_info.css('span').text

    active_status = corona_parsed.css('div.active-case')
    @active = active_status.css('span').text

    discharge_status = corona_parsed.css('div.discharge')
    @discharge = discharge_status.css('span').text

    death_status = corona_parsed.css('div.death_case')
    @death = death_status.css('span').text

    migrated_status = corona_parsed.css('div.migared_case')
    @migrated = migrated_status.css('span').text
  end

  def print_status
    # puts 'Status of Corona Cases in India ' + @date
    # puts 'Active Case: ' + @active
    # puts 'Discharged Case: ' + @discharge
    # puts 'Death Case: ' + @death
    # puts 'Migrated Case: ' + @migrated
  end
end
