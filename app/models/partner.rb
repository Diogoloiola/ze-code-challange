class Partner < ApplicationRecord
  include Filterable

  has_many :addresses
  accepts_nested_attributes_for :addresses

  validates :trading_name, :owner_name, :coverage_area, presence: true
  validates :document, uniqueness: true

  before_save :json_to_string

  scope :filter_by_coordinates, lambda { |value|
    where(id: Address.filter_by_coords(value).pluck(:id))
  }

  def parse_coordinates
    JSON.parse(coverage_area.gsub(/:([a-zA-z]+)/, '"\\1"').gsub('=>', ': ')).symbolize_keys
  end

  private

  def json_to_string
    self.coverage_area = coverage_area.to_s
  end
end
