require 'nokogiri'
require 'httparty'
require 'byebug'

class Festival
  # attr_reader :days_of_fest, :count

  def initialize
    url = 'https://www.drikpanchang.com/calendars/indian/indiancalendar.html'
    cal_unparsed = HTTParty.get(url)
    cal_parsed = Nokogiri::HTML(cal_unparsed)
    @events = cal_parsed.css('div.dpEventInfo')
    @time_today = Time.now.to_s
    @months = %w[January February
                 March April May June July August September October
                 November December]
    @days_of_fest = ""
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

  public

  def count_festivals
    @count = 0
    festivals.each do |date, event|
      if date.include? current_month
        @count += 1
        # days_of_fest += "#{date},"
    
      end
      
    end
    return @count
  end

  def days_of_fest
    
    festivals.each do |date, event|
      if date.include? current_month
        
        value = "#{date}".split(" ")
        @days_of_fest += (value[0] << " " << value[1] << " ")
              
      end
      
    end
    
    return @days_of_fest
  end
end

# fest = Festival.new
# # p fest.count_festivals
# p fest.days_of_fest
