class Address < ApplicationRecord
  attr_accessor :coordinates

  reverse_geocoded_by :latitude, :longitude

  belongs_to :partner

  scope :filter_by_coords, ->(point) { near(point.split(','), 9_999_999, order: :distance) }

  before_save :parse_coordinates

  private

  def parse_coordinates
    self.latitude = coordinates[0]
    self.longitude = coordinates[1]
  end
end
