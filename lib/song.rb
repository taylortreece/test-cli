class Song

    attr_reader :name, :artist, :chords, :key

    def initialize(name, artist, chords, key)
        @name = name
        @artist = artist
        @chords = chords
        @key = key
    end



end