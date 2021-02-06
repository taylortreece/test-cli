require_relative "../lib/scraper.rb"
require_relative "../lib/song.rb"
require_relative "../lib/key.rb"

def chord_manager(user_input)
    doc = Nokogiri::HTML(open("http://www.piano-keyboard-guide.com/key-of-#{user_input}.html"))
    c = doc.css(".entry-content ul li").text.split(")").delete_if {|a| a.include?("Chord") || a.include?("diminished") || a.include?("ii – V – I") || a.include?("I – vi – IV – V")}
    #@chords << @c_maj_chords = 
    c.map {|a| a + ")"}
end

def start

    @s=S.new

    puts "Welcome to your basic music theory coordinator!"
    puts ""
    puts "By typing from the options below, you can get access to information on all Major and minor keys."
    puts "If you want to check out a key, choose from the list below."
    puts "If you want to generate a random chord progression in a certain key, just pick the key from the list and say generate"
    puts ""

    puts "pick a key"
    puts @s.all_scale_names

    user_input = gets.strip

    puts chord_manager(user_input)
    
end

start