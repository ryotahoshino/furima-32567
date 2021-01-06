class Item < ApplicationRecord
with_options presence: true
  validates :name
  validates :detail
  validates :price
  validates :user

with_options presence: true, numericality: { other_than: 0 }
  validates :state_id
  validates :burden_id
  validates :origin_id
  validates :day_id
  validates :category_id

  belongs_to :user
  has_one :record
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :state
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :burden
  belongs_to :origin
  belongs_to :day


  def was_attacheda?
    self.image.attached?
  end
end