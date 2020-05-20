require_relative '../lib/corona'

describe Corona do
  let(:obj) { Jobs.new }
  let(:date) { obj.instance_variable_get(:@date) }
  let(:active) { obj.instance_variable_get(:@active) }
  let(:discharge) { obj.instance_variable_get(:@discharge) }
  let(:death) { obj.instance_variable_get(:@death) }
  let(:migrated) { obj.instance_variable_get(:@migrated) }
  url = 'https://www.mygov.in/covid-19/'
  corona_unparsed = HTTParty.get(url)
  corona_parsed = Nokogiri::HTML(corona_unparsed)

  describe 'initialize' do
    it 'should return string of Date' do
      date_info = corona_parsed.css('div.info_title')
      expect(date_info.css('span').text).to be_a(String)
    end

    it 'should return string of Active Cases' do
      active_status = corona_parsed.css('div.active-case')
      expect(active_status.css('span').text).to be_a(String)
    end

    it 'should return string of Death cases' do
      death_status = corona_parsed.css('div.death_case')
      expect(death_status.css('span').text).to be_a(String)
    end

    it 'should return string of Discharged cases' do
      discharge_status = corona_parsed.css('div.discharge')
      expect(discharge_status.css('span').text).to be_a(String)
    end

    it 'should return string of Migrated cases' do
      migrated_status = corona_parsed.css('div.migared_case')
      expect(migrated_status.css('span').text).to be_a(String)
    end
  end
end
