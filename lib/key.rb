require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative "../lib/song.rb"
require_relative "../lib/scraper.rb"

class Key

    attr_accessor :type, :name, :notes, :chords, :relative_fifth, :relative_key
    @@all = []

    def initialize(hash={})
    hash.each_pair do |type, name|
        @type = type
        hash[type].each_pair do |name, attribute|
            @name = name
          hash[type][name].each_pair do |attribute, value|
              instance_variable_set("@#{attribute}", value)
              self.class.instance_eval { attr_accessor attribute.to_sym }
            end
          end
        end
      @@all << self
    end

end

