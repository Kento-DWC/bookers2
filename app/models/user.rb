class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, uniqueness: true, length: { minimum: 2, maximum: 20 }
  validates :introduction, length: { maximum: 50 }
    
  has_many :books, dependent: :destroy
  has_many :favorites
  has_many :book_comments
  attachment :profile_image

  def liked?(book_id)
    favorites.where(book_id: book_id).exists?
  end
end
