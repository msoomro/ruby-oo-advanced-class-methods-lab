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
    song.save

    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name

    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save

    song
  end

  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
    
    nil
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)

    if song == nil
      return self.create_by_name(name)
    else
      return song
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    data = filename.slice(0..filename.length-5).split(" - ")
    song = self.new_by_name(data[1])
    song.artist_name = data[0]

    song
  end

  def self.create_from_filename(filename)
    data = filename.slice(0..filename.length-5).split(" - ")
    song = self.find_or_create_by_name(data[1])
    song.artist_name = data[0]

    song
  end

  def self.destroy_all
    @@all.clear
  end

end