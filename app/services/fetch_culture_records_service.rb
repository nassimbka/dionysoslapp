require 'culture_api'

class FetchCultureRecordsService
  # def print_test
  #   api_events = CultureApi.new.fetch_daily_records
  #   return api_events
  # end
  def call
    api_events = CultureApi.new.fetch_daily_records
    p api_events

    api_events.each do |api_event|
      api_venue = api_event[:venue]
      event = api_event[:event]
      venue = Venue.find_or_create_by(name: api_venue[:name]) do |v|
        v.address       = api_venue[:address]
        v.url           = api_venue[:url]
        v.phone_number  = api_venue[:phone_number]
      end

      Event.create!(
        venue:          venue,
        nom:            event[:nom],
        price:          event[:price],
        category:       event[:category],
        date:           event[:date],
        beginning_hour: event[:beginning_hour],
        end_hour:       event[:end_hour],
        description:    event[:description],
        url:            event[:url],
        picture:        event[:picture]
      )
    end
  end
end
