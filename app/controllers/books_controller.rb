class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
      @user = current_user
      @books = Book.order("id")
      @book = Book.new
  end

  def create
      @user = current_user
  		@book = Book.new(book_params)
      @book.user_id = current_user.id
  		if @book.save
      flash[:notice] = "Book was successfully created."
  		redirect_to user_path(current_user.id)
      else
      @books = Book.order("id")
      render "index"
      end
  end

  def show
      @book = Book.new
      @booki = Book.find(params[:id])
      @user = @booki.user
  end

  def edit
      @book = Book.find(params[:id])
  end

  def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to user_path(current_user.id)
      else
      render 'edit'
      end
  end

  def destroy
      book = Book.find(params[:id])
      book.delete
      @books = Book.all
      @book = Book.new
      flash[:notice] = "Book was successfully destroyed."
      redirect_to user_path(current_user.id)
  end

  private
  	def book_params
  		params.require(:book).permit(:title, :body)
  	end
    def user_params
      params.require(:user).permit(:name)
    end
end
