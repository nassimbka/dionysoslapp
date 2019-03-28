require 'cinema_scraper'

class FetchEventsService
  def call

    cinema_tag = Tag.find_by(name: "cinéma")
    films = CinemaScraper.new.scrape

    films.each do |title, details|
      p details
      venue = Venue.find_by!(name: details[:cinema])

      event_tag_name = details[:genre].parameterize
      # Try to find a tag for details[:genre].parameterize
      # If found tag, use details[:genre].parameterize directly for event category
      event_tag = Tag.find_by(name: event_tag_name)

      unless event_tag
        conversion_word = ConversionWord.find_by(name: event_tag_name)

        if conversion_word
          event_tag = conversion_word.tag
        else
          event_tag = cinema_tag
        end
      end
      # Else find conversion word for details[:genre].parameterize,
      # use the tag name behind it to fill in event category

      event = Event.create!(
        venue: venue,
        name: details[:title],
        description: details[:resume],
        url: details[:url],
        photo_url: details[:photo],
        beginning_hour: details[:date],
        category: event_tag_name
      )

      EventTag.create!(
        event: event,
        tag: event_tag
      )
    end
  end
end
