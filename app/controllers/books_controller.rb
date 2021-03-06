class BooksController < ApplicationController
	before_action :authenticate_user!
	def new
		@newbook = Book.new
		@books = Book.all
		@user = current_user
	end
	def index
		@book = Book.new
		@books = Book.all
		@user = current_user
	end
	def show
		@newbook = Book.new
		@book = Book.find(params[:id])
		@user = @book.user
	end
	#投稿データの保存
	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			flash[:notice] = "Book was successfully created"
			redirect_to @book
		else
			flash[:notice] = "error"
			@books = Book.all
			@user = current_user
			render :index
		end
	end
	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:notice] = "Book was successfully updated."
			redirect_to book_path(@book)
		else
			flash[:notice] = "error"
			@books = Book.all
			@user = current_user
			render :edit
		end
	end
	def edit
		@book = Book.find(params[:id])
		@user = current_user
		@books = Book.all
		unless @book.user_id == current_user.id
			redirect_to books_path
		end
	end
	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		flash[:notice] = "Book was successfully destroyed."
		redirect_to books_path
	end
private
    def book_params
    	params.require(:book).permit(:title, :body)
    end
    def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
