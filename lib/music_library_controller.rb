class MusicLibraryController
  attr_accessor :importer
  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end
  def call
    user_input = nil
    while user_input != "exit"
      # puts "Welcome to our Music Library"
      # puts "What would you like to do?"
      # puts "Please press 1 to list songs,
      # press 2 to list artists,
      # press 3 to list genres
      # press 4 to play a song,
      # press 5 to list an artist's song,
      # press 6 to list a genre's song."
      user_input = gets.chomp
      case user_input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "play a song"
        play_a_song
      when "artists song"
        artists_song
      when "genres song"
        genres_song
      # else
      #   puts"Remember only numbers between 1 and 6 are valid"
      end
    end
  end
  def list_songs
    sorted_songs_list = Song.all.sort_by { |song| song.artist.name}
    sorted_songs_list.each.with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  def list_artists
    Artist.all.each.with_index do |artist, index|
      puts "#{index+1}. #{artist.name}"
    end
  end
  def list_genres
    Genre.all.each.with_index do |genre, index|
      puts "#{index+1}. #{genre.name}"
    end
  end
  def play_a_song
  end
  def artists_song
  end
  def genres_song
  end
end
