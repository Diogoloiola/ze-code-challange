class Address < ApplicationRecord
  attr_accessor :coordinates

  belongs_to :partner

  before_save :parse_coordinates

  private

  def parse_coordinates
    self.latitude = coordinates[0]
    self.longitude = coordinates[1]
  end
end
