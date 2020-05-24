require 'nokogiri'
require 'httparty'
require 'byebug'

class Festival
  def initialize
    url = 'https://www.drikpanchang.com/calendars/indian/indiancalendar.html'
    cal_unparsed = HTTParty.get(url)
    cal_parsed = Nokogiri::HTML(cal_unparsed)
    @events = cal_parsed.css('div.dpEventInfo')
    @time_today = Time.now.to_s
    @months = %w[January February
                 March April May June July August September October
                 November December]
    @days_of_fest = ''
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

  public

  def current_month
    h = @time_today.split(' ')
    month = h[0].split('-')
    l = month[1].to_i
    @months[l - 1].capitalize
  end

  def count_festivals
    @count = 0
    festivals.each do |date, _event|
      @count += 1 if date.include? current_month
    end
    @count
  end

  def days_of_fest
    @days_of_fest = ''
    festivals.each do |date, _event|
      next unless date.include? current_month

      value = date.to_s.split(' ')
      @days_of_fest += (value[0] << ' ' << value[1] << ' ')
    end
    @days_of_fest
  end
end
