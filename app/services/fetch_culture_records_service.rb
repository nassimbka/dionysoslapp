require 'culture_api'

class FetchCultureRecordsService
  def call
    api_events = CultureApi.new.fetch_daily_records
      p api_events

    api_events.each do |api_event|
      api_venue = api_event[:venue]
      api_event = api_event[:event]
      venue = Venue.find_or_create_by(name: api_venue[:name]) do |v|
        v.address       = api_venue[:address]
        v.url           = api_venue[:url]
        v.phone_number  = api_venue[:phone_number]
      end

      Event.create!(
        venue:          venue,
        nom:            api_event[:nom],
        price:          api_event[:price],
        category:       api_event[:category],
        date:           api_event[:date],
        beginning_hour: api_event[:beginning_hour],
        end_hour:       api_event[:end_hour],
        description:    api_event[:description],
        url:            api_event[:url],
        picture:        api_event[:picture]
      )
    end
  end
end
