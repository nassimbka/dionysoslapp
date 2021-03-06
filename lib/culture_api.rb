require 'json'
require 'open-uri'

class CultureApi
  def fetch_daily_records
    culture_api_url = "https://data.nantesmetropole.fr/api/records/1.0/search/?dataset=244400404_agenda-evenements-nantes-nantes-metropole&rows=100&facet=emetteur&facet=rubrique&facet=lieu&facet=ville&refine.rubrique=Culture&refine.date=#{Date.today}"
    categories_needed = ['Expositions', 'Film / Projection', 'Danse', 'Conférence', 'Théâtre']
    event_serialized  = open(culture_api_url).read
    results           = JSON.parse(event_serialized)
    culture_records   = []

    results['records'].each do |record|
      categories = record['fields']['type'].split(',')

      record_is_usable = categories.any? {|category| categories_needed.include?(category)}
      next unless record_is_usable

      beginning_hour = record['fields']['heure_debut']
      if !beginning_hour.nil?
        now            = Time.now
        beginning_time = Time.parse(beginning_hour, now)
        if beginning_time.hour > 18
          culture_record = {}
          culture_record[:event] = {
            nom:            record['fields']['nom'],
            price:          record['fields']['gratuit'], # => "non" pas de champ price mais dire si est gratuit ou non
            category:       record['fields']['type'],
            date:           record['fields']['date'],
            beginning_hour: record['fields']['heure_debut'],
            end_hour:       record['fields']['heure_fin'],
            description:    record['fields']['description'],
            url:            record['fields']['lien_agenda'],
            picture:        record['fields']['media_1']
          } # pas venue_id

          culture_record[:venue] = {
            name:         record['fields']['lieu'],
            address:      record['fields']['adresse'],
            url:          record['fields']['lieu_siteweb'],
            phone_number: record['fields']['lieu_tel']
          } # pas type de etablisement, photo
          culture_records << culture_record
        end
      end
    end
    return culture_records
  end
end
# venue = Venue.create()
# Event.create(venue: venue)
