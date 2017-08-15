class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  # accepts_nested_attributes_for :notes

  def genre_name=(name)
     if name != ""
     	self.genre = Genre.find_or_create_by(name: name)
     end
   end

   def genre_name
   	self.genre.name if self.genre
   end


   def artist_name=(name)
     self.artist = Artist.find_or_create_by(name: name)
   end

   def artist_name
   		self.artist.name if self.artist
   end

   def note_contents=(notes_array)
     notes_array.each do |note|
     	if note != ""
			self.notes << Note.find_or_create_by(content: note)
		end
	end
   end

   def note_contents
   	self.notes.map do |note|
   		note.content
   	end
   end
end
