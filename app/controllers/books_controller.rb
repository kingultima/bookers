class BooksController < ApplicationController
  def top
  end

  def index
      @books = Book.order("id")
      @book = Book.new
  end

  def create
  		@book = Book.new(book_params)
  		if @book.save
      flash[:notice] = "Book was successfuly created."
  		redirect_to book_path(@book)
      else
      @books = Book.order("id")
      render "index"
      end
  end

  def show
  		@book = Book.find(params[:id])
  end

  def edit
      @book = Book.find(params[:id])
  end

  def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
      flash[:notice] = "Book was successfuly updated."
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
      flash[:notice] = "Book was successfuly destroyed  ."
      render 'index'
  end

  private
  	def book_params
  		params.require(:book).permit(:title, :body)
  	end

end
