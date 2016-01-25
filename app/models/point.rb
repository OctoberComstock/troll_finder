class Point < ActiveRecord::Base
  belongs_to :map

  validates :lat, presence: true
  validates :long, presence: true
end
