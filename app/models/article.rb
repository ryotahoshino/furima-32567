class Article < ApplicationRecord
  extend ActiveHash::Association::ActiveRecordExtensions
  belongs_to :genre
end