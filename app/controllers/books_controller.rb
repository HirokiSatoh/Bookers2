class BooksController < ApplicationController
	def new
		@book = Book.new
		@books = Book.all
		@user = User.ids
	end
	#投稿データの保存
	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@book.save
		redirect_to books_path
	end
	def index
		@books = Book.all
	end
	def show

	end
private
    def book_params
    	params.require(:book).permit(:title, :body)
    end
end
