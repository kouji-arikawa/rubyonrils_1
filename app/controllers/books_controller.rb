class BooksController < ApplicationController

  def new
  end

  def create
    book = Book.new(book_params)
    if book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(book.id)
    else
      render books_path
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @books = Book.find(params[:id])
  end

  def update
    @books = Book.find(params[:id])
    if @books.update(book_params)
      flash[:notice] = "Book was successfully updated"
      redirect_to book_path(@books.id)
    else
      render book_path
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = "Book was successfully destroyed."
      redirect_to books_path
    else
      render book_path
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
