class Book < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

  has_many :favorites
  has_many :book_comments
  belongs_to :user

  def like_count
    favorites.all.count
  end

  def comment_count
    book_comments.all.count
  end

end
