class Borrow < ApplicationRecord
	belongs_to :book
	validates :resident, :borrowed_date, :return_date, presence: true
	validate :check_existing_resident, :on => :create

  	def check_existing_resident
		if Borrow.where(resident: self.resident, is_returned: false).size > 0
			errors.add(:category, "This resident already has an unreturned book.")
		end
		if Borrow.where(book_id: self.book_id, is_approved: true, is_returned: false).size > 0
			errors.add(:category, "This book already already has an active request.")
		end
  	end

  	def information
  		if self.is_approved && self.is_returned
  			"This request is completed"
  		elsif self.is_approved && !self.is_returned
  			"This resident needs to return book by #{self.return_date.strftime('%v')}"
  		elsif !self.is_approved
  			"This book needs approval from librarian"
  		end

  	end
end
