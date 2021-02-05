require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative "../lib/song.rb"
require_relative "../lib/scraper.rb"

class Key

    attr_accessor :name, :notes, :chords, :relative_fifth, :songs

    @@all = []

    def self.all
        @@all
    end

    def self.create_new_key(name)


    end

    binding.pry
end

