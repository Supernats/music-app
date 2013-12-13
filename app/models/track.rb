class Track < ActiveRecord::Base
  attr_accessible :album_id, :track_type

  validates :album_id, :track_type, :presence => true

  belongs_to :album
  has_one :band, :through => :album

end