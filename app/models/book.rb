class Book < ApplicationRecord
  belongs_to :catagory
  has_many :read_books
  has_many :reviews
end
