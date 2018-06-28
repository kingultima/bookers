class BooksController < ApplicationController

  def index
      @user = current_user
      @books = Book.order("id")
      @book = Book.new
  end

  def create
      # @user = current_user
  		@book = Book.new(book_params)
      # @book.user_id = current_user.id
       # binding.pry
  		if @book.save
      flash[:notice] = "Book was successfully created."
  		redirect_to book_path(@book)
      else
      @books = Book.order("id")
      render "show"
      end
  end

  def show
      @user = User.find(params[:id])
      # @books = Book.page(params[:page])
      @books = current_user.books.all
  		@book = Book.new
  end

  def edit
      @book = Book.find(params[:id])
  end

  def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book)
      else
      render 'edit'
      end
  end

  def destroy
      book = Book.find(params[:id])
      book.delete
      @books = Book.order("id")
      @book = Book.new
      flash[:notice] = "Book was successfully destroyed."
      render 'index'
  end

  private
  	def book_params
  		params.require(:book).permit(:title, :body, :user_id)
  	end
end
