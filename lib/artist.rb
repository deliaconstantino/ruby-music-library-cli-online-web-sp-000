class Artist
  extend Concerns::Findable
  extend Concerns::Persistable::ClassMethods
  include Concerns::Persistable::InstanceMethods
  extend Concerns::Sortable::ClassMethods
  include Concerns::Sortable::InstanceMethods

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    song.artist=(self) unless song.artist == self
    @songs << song unless self.songs.include?(song)
  end

  def genres
    self.songs.collect { |song| song.genre }.uniq
  end

end

#moved to Persistable:
# def self.destroy_all
#   self.all.clear
# end
#
# def save
#   @@all << self
# end

# def self.create(name)
  # new_artist = self.new(name)
  # new_artist.save
  # new_artist
#
#   self.new(name).tap do|s|
#     s.save
#   end
# end
# end
