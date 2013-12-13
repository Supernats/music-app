class Album < ActiveRecord::Base
  validates :band_id, :name, :venue, :presence => true

  belongs_to :band
  has_many :tracks, :dependent => :destroy
end