require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative "../lib/song.rb"
require_relative "../lib/scraper.rb"

class Key

    attr_accessor :name, :notes, :chords, :relative_fifth, :relative_key
    @@all = []

    def initialize(name, notes, chords, relative_fifth, songs)

    end

    def self.all
        @@all
    end

    def self.create_new_key(name)


    end

end

