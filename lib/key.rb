require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative "../lib/song.rb"
require_relative "../lib/scraper.rb"

class Key

    attr_accessor :notes, :chords, :relative_fifth, :songs
    attr_reader :name

    @@all = []

    def initialize(name, notes, chords, relative_fifth, songs)
        

    end

    def self.all
        @@all
    end

end