class Album < ActiveRecord::Base
  attr_accessible :band_id, :name, :venue

  validates :band_id, :name, :venue, :presence => true
  validates :venue, :inclusion => ["studio","live"]


  belongs_to :band
  has_many :tracks, :dependent => :destroy
end