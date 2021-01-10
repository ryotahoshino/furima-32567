class Address < ApplicationRecord
with_options presence: true do
  validates :zip_code
  validates :urban_id
  validates :city
  validates :addresses
  validates :building
  validates :telephone_number
end

  belongs_to :record
end
