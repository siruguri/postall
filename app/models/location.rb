class Location < ActiveRecord::Base
  geocoded_by :address, :latitude  => :lat, :longitude => :long # ActiveRecord

  after_validation :geocode
end
