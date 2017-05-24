class Book < ApplicationRecord
	has_many :borrows
 	validates :title, :author_name, :category, :released_date, presence: true
end
