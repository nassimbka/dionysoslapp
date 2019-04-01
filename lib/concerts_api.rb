require 'open-uri'
require 'json'
require 'geocoder'
require 'nokogiri'

class ConcertsApi
  def fetch_daily_concerts
    today = Time.now.strftime("%Y-%m-%d") # recupere la date dans le bon format pour l'insérer dans l'url
    url = "https://api.songkick.com/api/3.0/metro_areas/28901/calendar.json?apikey=Qr8LLeKRlpqmnKpj&min_date=#{today}&max_date=#{today}" # url query pour récupérer les events du jour
    user_serialized = open(url).read
    results = JSON.parse(user_serialized)
    events = results['resultsPage']['results']['event'] # me récupère tous les events du jour

    concerts_array = []

    if events
      events.each do |event|
        concert_record = {}
        concert_record[:event] = {
          nom:            event['displayName'].split('(')[0].rstrip,
          price:          'payant',
          category:       'concert',
          date:           event['start']['date'],
          beginning_hour: event['start']['time'][0...-3],
          end_hour:       '',
          description:    event_description(event),
          url:            event['uri'],
          picture:        get_picture_url(event)
        }

        concert_record[:venue] = {

        }
      end
    else
      p 'No concerts today'
    end

  end

private
  def event_description(event)
    url = event["uri"]
    html_file = open(url).read
    html_doc  = Nokogiri::HTML(html_file)

    doc = html_doc.search('li.review-container p').first
    doc.children.text
  end

  def get_picture_url(event)
    page = event["uri"]
    html_file = open(page)
    html_doc  = Nokogiri::HTML(html_file)

    clean_url = html_doc.search('img.profile-picture.event').attribute('src').value[2..-1]
    clean_url
  end

end


# url = "https://api.songkick.com/api/3.0/metro_areas/28901/calendar.json?apikey=Qr8LLeKRlpqmnKpj&min_date=2019-04-02&max_date=2019-04-02" # url query pour récupérer les events du jour




# p results['resultsPage']['results']['event'][0]['displayName']

# p events.first
# p url
p "----------------------------------------------"


if events
  events.each do |event|
    p event['displayName'].split('(')[0].rstrip
  end

  # p "---------ici les name des events"

  # events.each do |event|
  #   p event['performance'][0]['displayName']
  # end

  # p "---------ici les date des events"

  # events.each do |event|
  #   p event['start']['date']
  # end

  puts "---------ici les event.venue.address"

  events.each do |event|
    lattitude = event['location']['lat']
    longitude = event['location']['lng']
    # p [lattitude, longitude]

    if lattitude && longitude
      result = Geocoder.search([lattitude, longitude]).first.data
      if result["address"]["house_number"]
        p "#{result["address"]["house_number"]}, #{result["address"]["road"]}, #{result["address"]["postcode"]} #{result["address"]["city"]}"
      else
        p "#{result["address"]["neighbourhood"]}, #{result["address"]["road"]}, #{result["address"]["postcode"]} #{result["address"]["city"]}"
      end
    end
  end
end

  # p "---------ici les beginning_hour des events"

  # events.each do |event|
  #   p event['start']['time'][0...-3]
  # end

  # p "---------ici les venue.name des events"

  # events.each do |event|
  #   p event['venue']['displayName']
  # end

  # p "---------ici les url des events"

  # events.each do |event|
  #   p event['uri']
  # end

  # p "---------ici les catégories des events"

  # events.each do |event|
  #   p event['type']
  # end

  # p "---------ici les venue.uri des events"

  # events.each do |event|
  #   p event['venue']["uri"]
  # end

  # p "---------ici les address des venues" # OK

  # events.each do |event| # ici tentative avortée de récupérer les adresses en scrapant les pages de venues
  #   url = event['venue']["uri"]
  #   html_file = open(url).read
  #   html_doc  = Nokogiri::HTML(html_file)
  #   p '!!!'
  #   doc = html_doc.search('p.venue-hcard span').first.children.each do |child|
  #     p child.text
  #   end
  # end

  # p "---------ici les descriptions des events" # OK

  # events.each do |event|
  #   url = event["uri"]
  #   html_file = open(url).read
  #   html_doc  = Nokogiri::HTML(html_file)

  #   doc = html_doc.search('li.review-container p').first
  #   p doc.children.text
  # end

#### Pseudo code
# Données à récupérer
# // Pour events: dateOK / price / beginning_hourOK / nameOK / url
# // Pour venue:  name / address ==> latt et longitude / url
# // Récupérer description ==> choper le lien de l'event OK
#
#
#
#
