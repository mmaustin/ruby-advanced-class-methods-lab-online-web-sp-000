class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self #seems like this refers to an instance and not the class?
  end

  def self.create
    song = self.new
    @@all << song
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
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find {|tune| tune.name == name}
=begin
    if !@@all.find {|song| song.name == name}
      false
    else
      @@all.find {|song| song.name == name}
    end
=end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    song = self.new
    song.artist_name = (file_name.split(" - ")[0])
    song.name = (file_name.split(" - ")[1].chomp(".mp3"))
    song
=begin
    items = file_name.split(/[-.]/)
      artist_name = items[0]
      song_name = items[1].split(".")
      name = song_name[0]

      song = self.new
      song.artist_name = artist_name
      song.name = name
      song
    items
=end
  end

end
