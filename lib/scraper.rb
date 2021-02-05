require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative "../lib/song.rb"
require_relative "../lib/key.rb"

class S

    def self.scrape_major_key_scale_overview
        doc = Nokogiri::HTML(open("https://piano-music-theory.com/2016/05/31/major-scales/"))
        major = doc.css("p").map {|a| a.text.split("\n")}
        @major_scales_information = major.flatten.select {|a| a.include?("Major Scale")}
    end
    
    def self.scrape_major_key_names
        self.scrape_major_key_scale_overview
        name = @major_scales_information.map {|a| a.split(":")}.flatten
        @major_scale_names = name.select {|a| a.include?("Major Scale")}.delete_if {|a| a.include?("\t" || "Categories")}
    end
    
    def self.scrape_major_key_notes
        self.scrape_major_key_scale_overview
        @major_scale_notes = @major_scales_information.map {|a| a.split(":")}.flatten.delete_if {|a| a == "Categories" || a.include?("Scale")}
    end

    def self.scrape_minor_key_scale_overview
        doc = Nokogiri::HTML(open("https://piano-music-theory.com/2016/06/01/minor-scales-natural-minor-scales/"))
        minor = doc.css("p").map {|a| a.text.split("\n")}
        @minor_scales_information = minor.flatten.select {|a| a.include?("Minor Scale")}
    end

    def self.scrape_minor_key_names
        self.scrape_minor_key_scale_overview
        name = @minor_scales_information.map {|a| a.split(":")}.flatten
        @minor_scale_names = name.select {|a| a.include?("Minor Scale")}.delete_if {|a| a.include?("\t" || "Categories")}
    end

    def self.scrape_minior_key_notes
        self.scrape_minor_key_scale_overview
        @minor_scale_notes = @minor_scales_information.map {|a| a.split(":")}.flatten.delete_if {|a| a == "Categories" || a.include?("Scale")}
    end

    def self.scrape_minor_key_notes
        self.scrape_minor_key_scale_overview
        @minor_scale_notes = @minor_scales_information.map {|a| a.split(":")}.flatten.delete_if {|a| a == "Categories" || a.include?("Scale")}
    end


    #Major Chords

    def self.c_maj_chords
        c_maj = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-c.html"))
        c = c_maj.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("Chord") || a.include?("diminished") || a.include?("ii – V – I") || a.include?("I – vi – IV – V")}
        @major_chords << @c_maj_chords = c.map {|a| a + ")"}
    end

    def self.c_sharp_maj_chords
       c_sharp_maj = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-c-sharp.html"))
       c = c_sharp_maj.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("Chord") || a.include?("diminished") || a.include?("#") || a.include?("ii – V – I") || a.include?("I – vi – IV – V")}
       @major_chords << @c_sharp_maj_chords = c.map {|a| a + ")"}
    end

    def self.d_flat_maj_chords
       d_flat_maj = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-d-flat.html"))
        d = d_flat_maj.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("Chord") || a.include?("diminished") || a.include?("#") || a.include?(".") || a.include?("ii – V – I") || a.include?("I – vi – IV – V")}
        @major_chords << @d_flat_maj_chords = d.map {|a| a + ")"}
    end
    
    def self.d_maj_chords
       d_maj = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-d.html"))
       d = d_maj.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("Chord") || a.include?("diminished") || a.include?("#") || a.include?(".") || a.include?("ii – V – I") || a.include?("I – vi – IV – V")}
       @major_chords << @d_maj_chords = d.map {|a| a + ")"}
    end

    #do not use d_sharp due to notation difficulties

    def self.e_flat_maj_chords
       e_flat_maj = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-e-flat.html"))
       e = e_flat_maj.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("Chord") || a.include?("diminished") || a.include?("#") || a.include?(".") || a.include?("ii – V – I") || a.include?("I – vi – IV – V")}
       @major_chords << @e_flat_maj_chords = e.map {|a| a + ")"}
    end

    def self.e_maj_chords
       e_maj = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-e.html"))
       e = e_maj.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("Chord") || a.include?("diminished") || a.include?("ii – V – I") || a.include?("I – vi – IV – V")}  
       @major_chords << @e_maj_chords = e.map {|a| a + ")"}
    end

    def self.f_maj_chords
       f_maj = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-f.html"))
       f = f_maj.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("Chord") || a.include?("diminished") || a.include?("#") || a.include?(".") || a.include?("ii – V – I") || a.include?("I – vi – IV – V")}
       @major_chords << @f_maj_chords = f.map {|a| a + ")"}
    end

    def self.f_sharp_maj_chords
        f_sharp_maj = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-f-sharp.html"))
        f = f_sharp_maj.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("Chord") || a.include?("diminished") || a.include?(".") || a.include?("flat") || a.include?("ii – V – I") || a.include?("I – vi – IV – V")}
        @major_chords << @f_sharp_maj_chords = f.map {|a| a + ")"}
    end
    
    def self.g_flat_maj_chords
        g_flat_maj = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-f-sharp.html"))
        g = g_flat_maj.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("Chord") || a.include?("diminished") || a.include?("#") || a.include?(".") || a.include?("sharp") || a.include?("Bmaj") || a.include?("ii – V – I") || a.include?("I – vi – IV – V")}
        @major_chords << @g_flat_maj_chords = g.map {|a| a + ")"}
    end

    def self.g_maj_chords
        g_maj = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-g.html"))
        g = g_maj.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("Chord") || a.include?("diminished") || a.include?("#") || a.include?(".") || a.include?("ii – V – I") || a.include?("I – vi – IV – V")}
        @major_chords << @g_maj_chords = g.map {|a| a + ")"}
    end

    #do not use g_sharp due to notation difficulties

    def self.a_flat_maj_chords
        a_flat_maj = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-a-flat.html"))
        a = a_flat_maj.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("flat") || a.include?("Chord") || a.include?("diminished") || a.include?("#") || a.include?(".") || a.include?("ii – V – I") || a.include?("I – vi – IV – V")}
        @major_chords << @a_flat_maj_chords = a.map {|a| a + ")"}
    end

    def self.a_maj_chords
        a_maj = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-a.html"))
        a = a_maj.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("flat") || a.include?("Chord") || a.include?("diminished") || a.include?(".") || a.include?("ii – V – I") || a.include?("I – vi – IV – V")}
        @major_chords << @a_maj_chords = a.map {|a| a + ")"}
    end

    def self.b_flat_maj_chords
        @a = []
        b_flat_maj = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-b-flat.html"))
        b = b_flat_maj.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("diminished") || a.include?(".") || a.include?("ii – V – I") || a.include?("I – vi – IV – V") || a.include?(":")}
        a = b.map {|a| a + ")"}.select {|a| a.include?("Chord") || a.include?("chord")}
        @major_chords << @b_flat_maj_chords = a.map {|a| a.split("Chord").to_s}
        a
    end

    def self.b_maj_chords
        b_maj = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-b.html"))
        b = b_maj.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("flat") || a.include?("diminished") || a.include?(".") || a.include?("ii – V – I") || a.include?("I – vi – IV – V")}
        @major_chords << @b_maj_chords = b.map {|a| a + ")"}
    end

    #Minor Chords

    def self.c_min_chords
        c_min = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-c-minor.html"))
        c = c_min.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("diminished") || a.include?(".") || a.include?("ii – v – i") || a.include?("i – VI – III – VII") || a.include?("i – iv – v") || a.include?("i – iv – VII") || a.include?("i – VI –  VII")}
        @minor_chords << @c_min_chords = c.map {|a| a + ")"}
    end

    def self.c_sharp_min_chords
        c_sharp_min = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-c-sharp-minor.html"))
        c = c_sharp_min.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("diminished") || a.include?(".") || a.include?("ii – v – i") || a.include?("i – VI – III – VII") || a.include?("i – iv – v") || a.include?("i – iv – VII") || a.include?("i – VI – VII")}
        @minor_chords << @c_sharp_min_chords = c.map {|a| a + ")"}
    end

    def self.c_sharp_min_chords
        c_sharp_min = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-c-sharp-minor.html"))
        c = c_sharp_min.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("diminished") || a.include?(".") || a.include?("ii – v – i") || a.include?("i – VI – III – VII") || a.include?("i – iv – v") || a.include?("i – iv – VII") || a.include?("i – VI – VII")}
        @minor_chords << @c_sharp_min_chords = c.map {|a| a + ")"}
    end

    def self.d_min_chords
        d_min = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-d-minor.html"))
        d = d_min.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("diminished") || a.include?(".") || a.include?("ii – v – i") || a.include?("i – VI – III – VII") || a.include?("i – iv – v") || a.include?("i – iv – VII") || a.include?("i – VI – VII")}
        @minor_chords << @d_min_chords = d.map {|a| a + ")"}
    end

    def self.d_sharp_min_chords
        d_sharp_min = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-d-sharp-minor.html"))
        d = d_sharp_min.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("diminished") || a.include?(".") || a.include?("ii – v – i") || a.include?("i – VI – III – VII") || a.include?("i – iv – v") || a.include?("i – iv – VII") || a.include?("i – VI – VII")}
        @minor_chords << @d_sharp_min_chords = d.map {|a| a + ")"}
    end

    def self.e_flat_min_chords
        e_flat_min = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-e-flat-minor.html"))
        e = e_flat_min.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("diminished") || a.include?(".") || a.include?("ii – v – i") || a.include?("i – VI – III – VII") || a.include?("i – iv – v") || a.include?("i – iv – VII") || a.include?("i – VI – VII")}
        @minor_chords << @e_sharp_min_chords = e.map {|a| a + ")"}
    end

    def self.e_min_chords
        e_min = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-e-minor.html"))
        e = e_min.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("diminished") || a.include?(".") || a.include?("ii – v – i") || a.include?("i – VI – III – VII") || a.include?("i – iv – v") || a.include?("i – iv – VII") || a.include?("i – VI – VII")}
        @minor_chords << @e_flat_min_chords = e.map {|a| a + ")"}
    end

    def self.f_min_chords
        f_min = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-f-minor.html"))
        f = f_min.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("diminished") || a.include?(".") || a.include?("ii – v – i") || a.include?("i – VI – III – VII") || a.include?("i – iv – v") || a.include?("i – iv – VII") || a.include?("i – VI – VII")}
        @minor_chords << @f_min_chords = f.map {|a| a + ")"}
    end

    def self.f_sharp_min_chords
        f_sharp_min = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-f-sharp-minor.html"))
        f = f_sharp_min.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("diminished") || a.include?(".") || a.include?("ii – v – i") || a.include?("i – VI – III – VII") || a.include?("i – iv – v") || a.include?("i – iv – VII") || a.include?("i – VI – VII")}
        @minor_chords << @f_sharp_min_chords = f.map {|a| a + ")"}
    end

    def self.f_min_chords
        f_min = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-f-minor.html"))
        f = f_min.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("diminished") || a.include?(".") || a.include?("ii – v – i") || a.include?("i – VI – III – VII") || a.include?("i – iv – v") || a.include?("i – iv – VII") || a.include?("i – VI – VII")}
        @minor_chords << @f_min_chords = f.map {|a| a + ")"}
    end

    # we are not using G Flat Minor

    def self.g_min_chords
        g_min = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-g-minor.html"))
        g = g_min.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("diminished") || a.include?(".") || a.include?("ii – v – i") || a.include?("i – VI – III – VII") || a.include?("i – iv – v") || a.include?("i – iv – VII") || a.include?("i – VI – VII")}
        @minor_chords << @g_min_chords = g.map {|a| a + ")"}
    end

    def self.g_sharp_min_chords
        g_sharp_min = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-g-sharp-minor.html"))
        g = g_sharp_min.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("diminished") || a.include?(".") || a.include?("ii – v – i") || a.include?("i – VI – III – VII") || a.include?("i – iv – v") || a.include?("i – iv – VII") || a.include?("i – VI – VII")}
        @minor_chords << @g_sharp_min_chords = g.map {|a| a + ")"}
    end

    def self.a_flat_min_chords
        a_flat_min = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-a-flat-minor.html"))
        a = a_flat_min.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("diminished") || a.include?(".") || a.include?("ii – v – i") || a.include?("i – VI – III – VII") || a.include?("i – iv – v") || a.include?("i – iv – VII") || a.include?("i – VI – VII")}
        @minor_chords << @a_flat_min_chords = a.map {|a| a + ")"}
    end

    def self.a_min_chords
        a_min = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-a-minor.html"))
        a = a_min.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("diminished") || a.include?(".") || a.include?("ii – v – i") || a.include?("i – VI – III – VII") || a.include?("i – iv – v") || a.include?("i – iv – VII") || a.include?("i – VI – VII")}
        @minor_chords <<  @a_min_chords = a.map {|a| a + ")"}
    end

    def self.a_sharp_min_chords
        a_sharp_min = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-a-sharp-minor.html"))
        a = a_sharp_min.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("diminished") || a.include?(".") || a.include?("ii – v – i") || a.include?("i – VI – III – VII") || a.include?("i – iv – v") || a.include?("i – iv – VII") || a.include?("i – VI – VII")}
        @minor_chords << @a_sharp_min_chords = a.map {|a| a + ")"}
    end

    def self.b_flat_min_chords
        b_flat_min = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-b-flat-minor.html"))
        b = b_flat_min.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("diminished") || a.include?(".") || a.include?("ii – v – i") || a.include?("i – VI – III – VII") || a.include?("i – iv – v") || a.include?("i – iv – VII") || a.include?("i – VI – VII")}
        @minor_chords << @b_flat_min_chords = b.map {|a| a + ")"}
    end

    def self.b_min_chords
        b_min = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-b-minor.html"))
        b = b_min.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("diminished") || a.include?(".") || a.include?("ii – v – i") || a.include?("i – VI – III – VII") || a.include?("i – iv – v") || a.include?("i – iv – VII") || a.include?("i – VI – VII") || a.include?("ii – V – I (C#m7 – F#7 – Bmaj7") || a.include?("I – vi – IV – V (B – G#m – E")}
        @minor_chords << @b_min_chords = b.map {|a| a + ")"}
    end

    def self.chords
        @major_chords = []
        self.c_maj_chords
        self.g_maj_chords
        self.d_maj_chords
        self.a_maj_chords
        self.e_maj_chords
        self.f_maj_chords
        self.b_flat_maj_chords
        self.e_flat_maj_chords
        self.a_flat_maj_chords
        self.b_maj_chords
        self.b_maj_chords
        self.f_sharp_maj_chords
        self.g_flat_maj_chords
        self.c_sharp_maj_chords
        self.d_flat_maj_chords

        @minor_chords = []
        self.a_min_chords
        self.e_min_chords
        self.b_min_chords
        self.f_sharp_min_chords
        self.c_sharp_min_chords
        self.d_min_chords
        self.g_min_chords
        self.c_min_chords
        self.f_min_chords
        self.g_sharp_min_chords
        self.a_flat_min_chords
        self.d_sharp_min_chords
        self.e_flat_min_chords
        self.a_sharp_min_chords
        self.b_flat_min_chords
    end 

    # Hash creation

    def self.all_scale_names_and_notes
        @names = []
        @names << self.scrape_major_key_names
        @names << self.scrape_minor_key_names

        @notes = []
        @notes << self.scrape_major_key_notes
        @notes << self.scrape_minor_key_notes
    end

    def self.create_hash_for_keys
        self.all_scale_names_and_notes
        self.chords

        @@keys = {}
        @@keys["major"] = {}
        @@keys["minor"] = {}

        @names[0].each do |name|          
            @@keys["major"][:"#{name}"] = {
                :notes => @notes[0][@@keys["major"].length],    
                :chords => @major_chords[@@keys["major"].length]
            }          
       end
       @names[1].each do |name|          
        @@keys["minor"][:"#{name}"] = {
            :notes => @notes[1][@@keys["minor"].length],
            :chords => @minor_chords[@@keys["minor"].length]
        }
        end
      @@keys
    end

    def self.keys
        self.create_hash_for_keys
        @@keys
    end

    #ATTR TO MANUALLY INPUT:
    #   @relative_fifth
    #   @songs



    binding.pry

end