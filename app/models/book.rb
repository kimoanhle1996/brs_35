class Book < ApplicationRecord
  belongs_to :catagory
  has_many :read_books
  has_many :reviews
  mount_uploader :picture, PictureUploader
  validate :picture_size
  scope :search, ->(term){where "title LIKE ? or author LIKE ?", "%#{term}%", "%#{term}%"}

  # def self.search term
  #   if term
  #     search = "%#{term}%"
  #     where("title LIKE ? or author LIKE ?", search, search)
  #   end
  # end

  private

  def picture_size
    if picture.size > Settings.size.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
