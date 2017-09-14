class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book
  scope :request_book, ->(id){where book_id: id}
end
