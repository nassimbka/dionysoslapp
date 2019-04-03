require 'cinema_scraper'

class FetchCinemaEventsService
  def call
    films_tags = [
      Tag.find_by(name: 'cinéma'),
      Tag.find_by(name: "posée"),
      Tag.find_by(name: "spectateur")
    ]

    films = CinemaScraper.new.scrape

    films.each do |_title, details|
      venue = Venue.find_by!(name: details[:cinema])

      event = Event.create!(
        venue:          venue,
        name:           details[:title],
        description:    details[:resume],
        url:            details[:url],
        photo_url:      details[:photo],
        beginning_hour: details[:date],
        genre:          details[:genre],
        category:       "Cinéma"
      )

      films_tags.each do |films_tag|
        EventTag.create!(event: event, tag: films_tag)
      end

      event_tag_name = details[:genre].parameterize
      event_tag = Tag.find_by(name: event_tag_name)
      event_tag ||= find_tag_by_conversion_word(event_tag_name)

      if event_tag
        EventTag.create!(
          event: event,
          tag:   event_tag
        )
      end
    end
  end

  def find_tag_by_conversion_word(name)
    conversion_word = ConversionWord.find_by(name: name)
    return unless conversion_word

    conversion_word.tag
  end
end
