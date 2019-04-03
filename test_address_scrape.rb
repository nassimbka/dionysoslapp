require 'open-uri'
require 'nokogiri'

url = 'https://www.songkick.com/concerts/37225469-les-femmes-sen-melent-at-stereolux-salle-micro?utm_source=56337&utm_medium=partner'
    html_file = open(url).read
    html_doc  = Nokogiri::HTML(html_file)

    scrapped_address = html_doc.search('p.venue-hcard > span')
    if scrapped_address != nil
      address_elements = scrapped_address.first.search('span').map do |s|
        s.text.strip
      end
      p address_elements
    end
    # cleaned_address = address_elements.join(",")
    cleaned_address = "#{address_elements[0]}, #{address_elements[1]} #{address_elements[2]} #{address_elements[3]}".strip
    p cleaned_address
