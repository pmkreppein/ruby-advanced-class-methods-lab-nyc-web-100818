class Song
  attr_accessor :name, :artist_name
  @@all = []

  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

 def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

 def self.create
    tune = Song.new
    tune.save
    tune
  end
  
  def self.new_by_name(name)
    tune = self.new
    tune.name = name
    tune
  end
  
  def self.create_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

 def self.create_from_filename(name)
    splitup = name.split(" - ")
    artist = splitup[0]
    song_title = parts[1].gsub(".mp3", "")
    new_song = self.create
    new_song.name = song_title
    new_song.artist_name = artist
    new_song
  end

end