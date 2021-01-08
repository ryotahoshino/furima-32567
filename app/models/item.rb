class Item < ApplicationRecord
with_options presence: true do
  validates :name
  validates :detail
  validates :price
  validates :user
  validates :image
end

  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }

  validates_inclusion_of :price, in: 300..9_999_999, message: 'Out of setting range'
with_options presence: true, numericality: { other_than: 0 } do
  validates :state_id
  validates :burden_id
  validates :origin_id
  validates :day_id
  validates :category_id
end

  belongs_to :user
  has_one :record
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :state
  belongs_to :category
  belongs_to :burden
  belongs_to :origin
  belongs_to :day

end