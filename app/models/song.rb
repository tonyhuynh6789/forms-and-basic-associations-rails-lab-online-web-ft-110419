class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  accepts_nested_attributes_for :notes, :reject_if => proc {|attrs| attrs[:content].blank?}

  # def notes_attributes=(hash)
  #   hash.each do |k,v| 
  #     self.notes.build(v) if 
  #   end 
  # end 

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end 

  def artist_name
    self.artist.try(:name)
  end 

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end 

  def genre_name
    self.genre.try(:name)
  end 

end
