require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

    def scrape
        @doc = Nokogiri::HTML(open("https://www.pianoscales.org/major.html"))
        @doc.css("section-3").collect { |post| post }
    end

    def scrape_major_scale_of_key

    end

    def scrape_minor_scale_of_key

    end

    def scrape_chords_in_key

    end

end
