class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def get_genre_name
    self.genre.name()
  end

  # when this method is called it should assign the song's artist to Drake
  # Drake doesn't exist in the database as an artist yet, so you'll have to create a record
  # Hint: you won't want to create an artist record every time this method is called, only if Drake is *not found*
  def drake_made_this
    # First attempt:
    # self.artist where(?) = "Drake"
    # Second attempt:
    # self.artist.where("?.name = Drake", self.artist.name)
    # NOTE: I would have never gotten this in a million years --> Where on earth was
    # '.find_or_create_by()' mentioned in any of the lessons?
    # Also, where was the hint to even use .update() in this section either???
    drake = Artist.find_or_create_by(name: "Drake")
    # I guess the fact that we don't want to create duplicate records means that we only
    # want to update a song to include the fact that the 'artist' would be changed to 'Drake'
    # when the 'drake_made_this' method is called:
    self.update(artist: drake)
  end
end
