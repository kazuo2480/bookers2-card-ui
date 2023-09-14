class Book < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy
	has_one_attached :book_image

	validates :book_image, presence: true
	validates :title, presence: true
  	validates :body, presence: true, length: { maximum: 200 }

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
	def get_book_image
		unless book_image.attached?
		  file_path = Rails.root.join('app/assets/images/no_book.png')
		  book_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/png')
		end
		book_image
	  end
	
end
