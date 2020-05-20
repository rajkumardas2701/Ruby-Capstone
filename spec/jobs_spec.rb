require_relative '../lib/jobs'

describe Jobs do
  let(:obj) { Jobs.new }
  let(:jobs) { obj.instance_variable_get(:@jobs) }
  url = 'https://www.freshersworld.com/jobs-in-bangalore/9999016065'
  jobs_unparsed = HTTParty.get(url)
  jobs_parsed = Nokogiri::HTML(jobs_unparsed)

  describe 'initialize' do
    it 'should be able to get Nokogiri content from HTML' do
      expect(jobs_parsed).to be_a(Nokogiri::HTML::Document)
    end
  end

  describe 'fetch_job' do
    it 'should return all the jobs posting in an array' do
      expect(obj.fetch_job).to be_a(String)
    end
  end
end
