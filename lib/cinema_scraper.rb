require 'nokogiri'
require 'open-uri'

class CinemaScraper
  CINEMAS = {
    'Katorza' => 'https://nantes.maville.com/cinema/cinemam_salle_-nantes-katorza_cinema-100007859_cine.Htm',
    'Gaumont Nantes' => 'https://nantes.maville.com/cinema/cinemam_salle_-nantes-gaumont-nantes_cinema-100006892_cine.Htm',
  }

  def scrape
    films = {}

    CINEMAS.each do |cinema, url|
      html_file = open(url).read
      html_doc  = Nokogiri::HTML(html_file)

      html_doc.search('.elmt-liste-ligne.photo .element').each do |film|
        result_method = search_photo_and_resume("https://nantes.maville.com#{film.search('.floatL a').attribute('href').value}")
        films[film.search('.elmt-content .elmt-titre').text] = {
          title: film.search('.elmt-content .elmt-titre').text,
          cinema: cinema,
          date: film.search('li:first-child time').text.delete("\n").gsub("\r", " ").split(":").last,
          photo: result_method[:photo],
          resume: result_method[:resume],
          url: "https://nantes.maville.com#{film.search('.floatL a').attribute('href').value}",
          genre: film.search('.elmt-text a').text.split.first
        }
      end
    end

    return films
  end

  private

  def search_photo_and_resume(url)
    result_method = {}
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)

    result_method[:photo] = html_doc.search('.link-flash .photo img').first.attribute('src').value
    result_method[:resume] = html_doc.search('.elmt-content p.elmt-text').first.text.strip.chomp
    result_method
  end
end

# films = CinemaScraper.new.scrape
# p films.first
