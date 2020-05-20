require_relative '../lib/festivals'

describe Festival do
  let(:obj) { Festival.new }
  let(:fest) { obj.instance_variable_get(:@fest) }
  url = 'https://www.drikpanchang.com/calendars/indian/indiancalendar.html'
  cal_unparsed = HTTParty.get(url)
  cal_parsed = Nokogiri::HTML(cal_unparsed)
  @events = cal_parsed.css('div.dpEventInfo')

  describe 'initialize' do
    it 'should be able to get Nokogiri content from HTML' do
      expect(cal_parsed).to be_a(Nokogiri::HTML::Document)
    end
  end

  describe 'current_month' do
    it 'should return String as month' do
      expect(obj.current_month).to be_a(String)
    end
  end

  describe 'count_festivals' do
    it 'should return Integer as the number of Festivals' do
      expect(obj.count_festivals).to be_a(Integer)
    end
  end

  describe 'days_of_fest' do
    it 'should return String of festivals' do
      expect(obj.days_of_fest).to be_a(String)
    end
  end
end
