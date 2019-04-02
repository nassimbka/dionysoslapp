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

      event = Event.create!(
        venue:          venue,
        name:           api_event[:nom],
        price:          api_event[:price],
        category:       api_event[:category],
        date:           api_event[:date],
        beginning_hour: api_event[:beginning_hour],
        description:    api_event[:description],
        url:            api_event[:url],
        photo_url:      api_event[:picture]
      )

      concert_tags = ['dynamique', 'solo', 'couple', 'groupe', 'musique', 'payant']
      concert_tags.each do |tag|
        EventTag.create!(event: event, tag: Tag.find_by(name: tag))
      end
    end

  end
end
