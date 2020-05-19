require 'nokogiri'
require 'httparty'
require 'byebug'

class Jobs
  def initialize
    url = 'https://www.freshersworld.com/jobs-in-bangalore/9999016065'
    jobs_unparsed = HTTParty.get(url)
    jobs_parsed = Nokogiri::HTML(jobs_unparsed)
    @jobs = jobs_parsed.css('div.job-container')
    @vacancies = []
  end

  def fetch_jobs
    @jobs.each do |job|
      value = job.css('div.job-desc-block')
      value1 = value[0].css('div')[1]
      value2 = value1.css('div')[1]
      @job_posting = {
        company: job.css('h3.latest-jobs-title').text,
        position: value2.text,
        apply_url: job.css('a')[0].attributes['href'].value
      }

      @vacancies << @job_posting
    end
  end

  def print_jobs
    fetch_jobs
    @vacancies
  end
end

job = Jobs.new
p job.print_jobs
