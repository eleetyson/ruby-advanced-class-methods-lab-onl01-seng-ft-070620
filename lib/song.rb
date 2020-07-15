class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end
  
  def self.find_by_name(name)
    self.all.detect {|s| s.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) == nil ? self.create_by_name(name) : self.find_by_name(name) 
  end
  
  def self.alphabetical
    self.all.sort_by {|s| s.name}
  end
  
  def self.new_from_filename(file)
    clean_file = file.gsub(".mp3", "").split("-")
    file_artist_name = clean_file[0].strip
    file_song_name = clean_file[1].strip
    
    song = self.new
    song.artist_name = file_artist_name
    song.name = file_song_name
    song
  end
  
  def self.create_from_filename(file)
    self.new_from_filename(file).save
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end
