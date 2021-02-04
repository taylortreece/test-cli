class Key

    attr_reader :notes, :chords, :relative_fifth, :songs

    @@all = []

    def initialize(notes, chords, relative_fifth, songs)

    end

    def self.all
        @@all
    end

end