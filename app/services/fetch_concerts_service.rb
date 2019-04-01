require 'concerts_api'

class FetchConcertsService
  def call
    concerts_api = ConcertsApi.new

    # films.each do |title, details|
    #   venue = Venue.find_by!(name: details[:cinema])

    #   event = Event.create!(
    #     venue: venue,
    #     name: details[:title],
    #   )

      # TODO event_tags
    end
  end
end
