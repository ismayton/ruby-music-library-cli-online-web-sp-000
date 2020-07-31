require 'pry'

class Artist 
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  
  @@all = [] 
  
  def initialize(name)
    @songs = []
    @name = name 
    save 
  end 
  
  def self.all 
    @@all 
  end 
  
  def save
    @@all << self 
  end 
  
  def self.destroy_all 
    @@all.clear
  end 
  
  def self.create(name)
    artist = Artist.new(name)
  end
  
  def songs
    @songs 
  end 
  
  def add_song(song)
    if !@songs.include?(song)
      @songs << song
    end 
    if song.artist.class != Artist
      song.artist = self
    end 
  end 
  
  def genres 
    final = []
    @songs.each do |song|
      if !final.include?(song.genre)
        final << song.genre
      end 
    end 
    final
  end
  
end 
