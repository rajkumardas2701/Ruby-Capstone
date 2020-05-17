require 'nokogiri'
require 'httparty'
require 'byebug'

class Festival
  # attr_reader :print_festivals

  def initialize
    url = 'https://www.drikpanchang.com/calendars/indian/indiancalendar.html'
    cal_unparsed = HTTParty.get(url)
    cal_parsed = Nokogiri::HTML(cal_unparsed)
    @events = cal_parsed.css('div.dpEventInfo')
    @time_today = Time.now.to_s
    @months = %w[January February
                 March April May June July August September October
                 November December]
  end

  private

  def festivals
    all_events = {}
    @events.each do |event|
      event_date = event.css('div.dpEventGregDate').text
      all_events[event_date.to_s] = event.css('div.dpEventName').text
    end
    all_events
  end

  def current_month
    h = @time_today.split(' ')
    month = h[0].split('-')
    l = month[1].to_i
    @months[l - 1].capitalize
  end

  public

  def print_festivals
    puts "Festivals in the month of #{current_month} are:"
    festivals.each do |date, event|
      puts "#{date}, celebrated as \"#{event}\"" if date.include? current_month
    end
  end
end
