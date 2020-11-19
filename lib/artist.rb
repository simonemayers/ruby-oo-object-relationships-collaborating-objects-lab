class Artist
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name = name
        save
    end
    def save
        @@all << self
    end
    def self.all
        @@all 
    end
    def add_song(name)
        name.artist = self
    end
    def songs
        Song.all.select {|song| song.artist == self}
    end
    def self.find_or_create_by_name(name)
        artist_object = nil
        self.all.find do |artist| 
            artist_object = artist if artist.name == name    
        end
        artist_object == nil ? self.new(name) : artist_object
    end
    def print_songs 
        songs.each {|song| puts song.name}
    end
end