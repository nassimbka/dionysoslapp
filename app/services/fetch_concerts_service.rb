require 'concerts_api'

class FetchConcertsService
  def call
    api_events = ConcertsApi.new.fetch_daily_concerts
    api_events.each do |api_event|
      concert_venue = api_event[:venue]
      event = api_event[:event]
      venue = Venue.find_or_create_by(name: concert_venue[:name]) do |v|
        v.address       = concert_venue[:address]
        v.url           = concert_venue[:url]
        v.phone_number  = concert_venue[:phone_number]
      end
    end
  end
end
