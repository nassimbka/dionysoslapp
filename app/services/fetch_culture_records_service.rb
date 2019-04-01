require 'culture_api'

class FetchCultureRecordsService
  def call
    api_events = CultureApi.new.fetch_daily_records
    api_events.each do |api_event|
      api_venue = api_event[:venue]
      api_event = api_event[:event]
      venue = Venue.find_or_create_by(name: api_venue[:name]) do |v|
        v.address       = api_venue[:address]
        v.url           = api_venue[:url]
        v.phone_number  = api_venue[:phone_number]
      end

      event = Event.create!(
        venue:          venue,
        name:           api_event[:nom],
        price:          api_event[:price],
        category:       api_event[:category],
        date:           api_event[:date],
        beginning_hour: api_event[:beginning_hour],
        end_hour:       api_event[:end_hour],
        description:    api_event[:description],
        url:            api_event[:url],
        picture:        api_event[:picture]
      )

      categories = api_event[:category].split(',')
      # =>["Cirque", "Enfant", "Théâtre", "Humour"]
      categories.each do |category|
        if category.casecmp?("Théâtre")
          theatre_tags = [
            Tag.find_by(name: 'théâtre'),
            Tag.find_by(name: "posée"),
            Tag.find_by(name: "regarder")
          ]
        elsif category.casecmp?("Humour")
          EventTag.create!(event: event, tag: Tag.find_by(name: 'comedie'))
        elsif category.casecmp?("Spectacle Musical")
          EventTag.create!(event: event, tag: Tag.find_by(name: 'musical'))
        end
          if theatre_tags.present?
            theatre_tags.each do |theatre_tag|
              EventTag.create!(event: event, tag: theatre_tag)
            end
          end

        if category.casecmp?("Danse")
          culture_tags = [
              Tag.find_by(name: "posée"),
              Tag.find_by(name: "social"),
              Tag.find_by(name: "culture"),
              Tag.find_by(name: "danse")
            ]
        elsif category.casecmp?("Film / Projection")
          culture_tags = [
              Tag.find_by(name: "posée"),
              Tag.find_by(name: "social"),
              Tag.find_by(name: "culture"),
              Tag.find_by(name: "documentaire")
            ]
        elsif category.casecmp?("Expositions")
          culture_tags = [
              Tag.find_by(name: "posée"),
              Tag.find_by(name: "social"),
              Tag.find_by(name: "culture"),
              Tag.find_by(name: "exposition")
            ]
        elsif category.casecmp?("Conférence")
          culture_tags = [
              Tag.find_by(name: "posée"),
              Tag.find_by(name: "social"),
              Tag.find_by(name: "culture"),
              Tag.find_by(name: "conférence")
            ]
        end

          if culture_tags.present?
            culture_tags.each do |culture_tag|
              EventTag.create!(event: event, tag: culture_tag)
            end
          end
      end
    end
  end
end
