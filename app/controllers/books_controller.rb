class BooksController < ApplicationController
	before_action :set_book, only: [:show, :update, :destroy, :edit]
	helper_method :sort_column, :sort_direction

	def index
		@categories = Book.all.map { |b| b.category.split(',').map!(&:strip) }.flatten(1).uniq
		@selected = params[:category]
		if !!@selected
			@books = Book.where("category LIKE ?", "%#{@selected}%")
		else
			@books = Book.order(sort_column + " " + sort_direction)
		end
	end

	def new
		@book = Book.new
	end

	def edit
	end

	def create
 		@book = Book.new(book_params)
 		if @book.save
 			redirect_to @book
 		else
 			render "new"
 		end
	end

	def update
		if @book.update(book_params)
			redirect_to @book
		else
			render 'edit'
		end
	end

	def show
	end

	def destroy
		@book.destroy
		redirect_to books_path
	end

	private

	def set_book
		@book = Book.find(params[:id])
	end

	def book_params
		params.require(:book).permit(:title,:author_name, :released_date, :category)
  	end

  	def sort_column
    	Book.column_names.include?(params[:sort]) ? params[:sort] : "title"
  	end
  
  	def sort_direction
    	%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  	end
end
