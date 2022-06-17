class Partner < ApplicationRecord
  before_save :json_to_string

  validates :trading_name, :owner_name, :document, :coverage_area, presence: true

  def parse_coordinates
    JSON.parse(coverage_area.gsub(/:([a-zA-z]+)/, '"\\1"').gsub('=>', ': ')).symbolize_keys
  end

  private

  def json_to_string
    self.coverage_area = coverage_area.to_string
  end
end
