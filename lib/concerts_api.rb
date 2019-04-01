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

    concerts = []

    if events
      events.each do |event|
        concert = {}
        concert[:event] = {
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

        concert[:venue] = {
          name:         event['venue']['displayName'],
          address:      event_address(event),
          url:          event['venue']["uri"],
          phone_number: ''
        }
        concerts << concert
      end
    end
    return concerts
  end

  private

  def event_description(event)
    url = event["uri"]
    html_file = open(url).read
    html_doc  = Nokogiri::HTML(html_file)

    reviews = html_doc.search('li.review-container p').first

    if reviews.nil?
      'Superbe performance scénique. A voir avec les oreilles et à écouter avec les yeux!'
    else
      reviews.children.text
    end
  end

  def get_picture_url(event)
    page = event["uri"]
    html_file = open(page)
    html_doc  = Nokogiri::HTML(html_file)

    clean_url = html_doc.search('img.profile-picture.event').attribute('src').value[2..-1]
    clean_url
  end

  def event_address(event)
    lattitude = event['location']['lat']
    longitude = event['location']['lng']

    if lattitude && longitude
      result = Geocoder.search([lattitude, longitude]).first.data
      if result["address"]["house_number"]
        "#{result["address"]["house_number"]}, #{result["address"]["road"]}, #{result["address"]["postcode"]} #{result["address"]["city"]}"
      else
        "#{result["address"]["neighbourhood"]}, #{result["address"]["road"]}, #{result["address"]["postcode"]} #{result["address"]["city"]}"
      end
    else
      "Adresse non-communiquée par l'établissement."
    end
  end
end

  # p "---------ici les address des venues" #

  # events.each do |event| # ici tentative avortée de récupérer les adresses en scrapant les pages de venues
  #   url = event['venue']["uri"]
  #   html_file = open(url).read
  #   html_doc  = Nokogiri::HTML(html_file)
  #   p '!!!'
  #   doc = html_doc.search('p.venue-hcard span').first.children.each do |child|
  #     p child.text
  #   end
  # end

