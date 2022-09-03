class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def get_first_song
    # NOTE: Here we are using the #songs instance method that was created by the
    # 'has_many' macro, and we are using chaining since we will have an array returned
    # and want to only observe the first result of it with .first():
    self.songs.first()
  end

  # return the genre of the artist's first saved song
  def get_genre_of_first_song
    self.songs.first.genre()
  end

  # return the number of songs associated with the artist
  def song_count
    self.songs.count()
  end

  # return the number of genres associated with the artist
  def genre_count
    self.genres.count()
  end
end
