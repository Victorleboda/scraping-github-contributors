require 'HTTParty'
require 'json'
require 'csv'

response = HTTParty.get('https://api.github.com/repos/bigardone/phoenix-trello/contributors')


data = JSON.parse(response.body)
filepath = 'contributors.csv'

CSV.open(filepath, 'wb') do |csv|
    data.each do |contributor|
        csv << [contributor['login'], contributor['html_url']]
    end
end

