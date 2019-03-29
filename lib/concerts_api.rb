require 'open-uri'
require 'json'


url = "https://api.songkick.com/api/3.0/metro_areas/28901/calendar.json?apikey=Qr8LLeKRlpqmnKpj&min_date=2019-03-28&max_date=2019-03-28"


# url = "https://api.songkick.com/api/3.0/search/locations.json?query=Nantes&apikey=Qr8LLeKRlpqmnKpj"
# p url
user_serialized = open(url).read
results = JSON.parse(user_serialized)

# p results['resultsPage']['results']['event'][0]['displayName']

events = results['resultsPage']['results']['event']

events.each do |event|
  p event['displayName']
end
