class Genre

  extend Concerns::Memorable::ClassMethods, Concerns::Findable
  include Concerns::Memorable::InstanceMethods

  attr_accessor :name
  attr_reader :songs

  @@all=[]

  def initialize(name)
    self.name=name
    @songs=[]
  end
  def add_song(song)
    song.genre = self unless song.genre == self
    #songs<<song unless songs.include?(song)
  end
  def artists
    songs.collect{|song| song.artist}.uniq
  end
  def songs
    @songs = Song.all
  end
  def self.all
    @@all
  end

end
