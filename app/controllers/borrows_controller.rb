class BorrowsController < ApplicationController
	before_action :set_book, only: [:new, :edit, :create, :update, :destroy, :edit]
	before_action :set_borrow, only: [:edit, :update]

	def index
		@borrows = Borrow.order("resident asc")
	end

	def create
		@borrow = Borrow.new(borrow_params)
		@borrow.book_id = @book.id
		if @borrow.save
 			redirect_to book_path(@book)
 		else
 			render "new"
 		end
	end

	def update
		if @borrow.update(borrow_params)
			redirect_to book_path(@book)
		else
			render 'edit'
		end
	end

	def new
		@borrow = Borrow.new
	end

	def edit
	end

	private

	def set_book
		@book = Book.find(params[:book_id])
	end

	def set_borrow
		@borrow = Borrow.find(params[:id])
	end
	
	def borrow_params
		params.require(:borrow).permit(:resident, :borrowed_date, :return_date, :is_approved)
	end
end
