require_relative "../lib/scraper.rb"
require_relative "../lib/song.rb"
require_relative "../lib/key.rb"
require 'nokogiri'
require 'open-uri'
require 'pry'


def input_modifier   
    @modified_user_input = @user_input.split(" ").join("-").downcase
    @modified_user_input
end

def individual_chord_scraper
    user_input = gets.strip

    @modified_user_input = user_input.split(" ").join("-").downcase

        if @modified_user_input == "b-flat"
           b_flat_maj = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-b-flat.html"))
           b = b_flat_maj.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?(".") || a.include?("ii – V – I") || a.include?("I – vi – IV – V") || a.include?(":")}
           a = b.map {|a| a + ")"}.select {|a| a.include?("Chord") || a.include?("chord")}
           a.map! {|a| a.split(/chord/i)}
           @user_input_chords = a.flatten.reject {|a| a.empty?}
        elsif @modified_user_input == "c-flat"
           b_flat_maj = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-b-flat.html"))
           b = b_flat_maj.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?(".") || a.include?("ii – V – I") || a.include?("I – vi – IV – V") || a.include?(":")}
           a = b.map {|a| a + ")"}.select {|a| a.include?("Chord") || a.include?("chord")}
           a.map! {|a| a.split(/chord/i)}
           @user_input_chords = a.flatten.reject {|a| a.empty?}
        elsif @modified_user_input == "e-flat"
           e_flat_maj = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-e-flat.html"))
           e = e_flat_maj.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("Chord") || a.include?("Eb – Ab – Bb") || a.include?("#") || a.include?(".") || a.include?("ii – V – I") || a.include?("I – vi – IV – V")}
           @user_input_chords = e.map {|a| a + ")"}.flatten
        elsif @modified_user_input == "f-sharp"
           f_sharp_maj = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-f-sharp.html"))
           f = f_sharp_maj.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("Chord") || a.include?(".") || a.include?("flat") || a.include?("ii – V – I") || a.include?("I – vi – IV – V")}
           @user_input_chords = f.map {|a| a + ")"}.flatten
        elsif @modified_user_input == "g-flat"
           g_flat_maj = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-f-sharp.html"))
           g = g_flat_maj.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("Chord") || a.include?("#") || a.include?(".") || a.include?("sharp") || a.include?("Bmaj") || a.include?("ii – V – I") || a.include?("I – vi – IV – V")} 
           @user_input_chords = g.map {|a| a + ")"}.flatten
        elsif @modified_user_input == "c-sharp"
           c_sharp_maj = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-c-sharp.html"))
           c = c_sharp_maj.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("Chord") || a.include?("#") || a.include?("ii – V – I") || a.include?("I – vi – IV – V")}
           @user_input_chords = c.map {|a| a + ")"}.flatten
        elsif @modified_user_input.include?("minor")
           g_min = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-#{@modified_user_input}.html"))
           g = g_min.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?(":") || a.include?(".") || a.include?("ii – v – i") || a.include?("i – VI – III – VII") || a.include?("i – iv – v") || a.include?("i – iv – VII") || a.include?("i – VI – VII")}
           @user_input_chords = g.map {|a| a + ")"}
        else
           doc = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-#{@modified_user_input}.html"))
           c = doc.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("Chord") || a.include?("ii – V – I") || a.include?("I – vi – IV – V") || a.include?(".")}
           @user_input_chords = c.map {|a| a + ")"}.flatten
        end        
   @user_input_chords
end

def key_information_creator
   
   individual_chord_scraper

   all_scale_names
   all_scale_notes


   @user_input_name = @user_input

   @user_key_info = {}
   @user_key_info["Major"] = {}
   @user_key_info["minor"] = {}
    
   if @user_input_name.include?("minor")
    user_notes_index = @minor_scale_names.find_index(@user_input_name)

    @user_key_info["minor"][:"#{@user_input_name}"] = {
       :notes => @notes[1][user_notes_index].lstrip,    
       :relative_fifth => @notes[1][user_notes_index].split(" ")[8]+" minor",
       :relative_minor => @notes[1][user_notes_index].split(" ")[4]+" Major",
       :chords => @user_input_chords
   }
   else
    user_notes_index = @major_scale_names.find_index(@user_input_name)

    @user_key_info["Major"][:"#{@user_input_name.capitalize}"] = {
       :notes => @notes[0][user_notes_index.to_i].lstrip,    
       :relative_fifth => @notes[0][@user_key_info["Major"].length].split(" ")[8]+" Major",
       :relative_minor => @notes[0][@user_key_info["Major"].length].split(" ")[10]+" minor",
       :chords => @user_input_chords
}   
  end
end  

def start

    puts "Welcome to your basic music theory coordinator!"
    puts ""
    puts "By choosing from the options below by typing your selection, you can get access to information on all Major and minor keys."
    puts "If you want to check out a key, choose from the list below."
    puts "If you want to generate a random chord progression in a certain key, just pick the key from the list and say generate"
    puts ""

    puts "Pick a key:"
    puts " "
    puts "Major:"
    puts all_scale_names[0]
    puts " "
    puts "Minor:"
    puts all_scale_names[1]

    @user_input = gets.strip 

    key_information_creator


end

start



# C=>
#     {:notes=>"C – D – E – F – G – A – B – C",
#      :relative_fifth=>"G Major",
#      :relative_minor=>"A minor",
#      :chords=>
#       ["I – C major, C major seventh (Cmaj, Cmaj7)",
#        "ii – D minor, D minor seventh (Dm, Dm7)",
#        "iii – E minor, E minor seventh (Em, Em7)",
#        "IV – F major, F major seventh (F, Fmaj 7)",
#        "V – G major, G dominant seventh (G, G7)",
#        "vi – A minor, A minor seventh (Am, Am7)",
#        "vii° – B diminished, B minor seventh flat five (B°, Bm7b5)"]}
binding.pry