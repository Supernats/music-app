class Track < ActiveRecord::Base
  validates :album_id, :track_type, :presence => true

  belongs_to :album
  has_one :band, :through => :album

end