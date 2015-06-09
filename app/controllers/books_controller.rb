class BooksController < ApplicationController

def index
  @books = Book.all
end

def create
   @book = Book.new(book_params)
      if @book.save 
        # it returned true. Do stuff
        redirect_to books_path
    else
        # it returned false. Do different stuff
      render :new
     end
  
end

def new
  @book = Book.new
end

def edit
  @book
  
end

def show
  
end

def update
  if @book.update(book_params)
    redirect_to book_path
  else
    render :edit
  end
end

def destroy
  @book.destroy
  redirect_to books_path
  
end

private

def book_params
      params.require(:book).permit(:title, :released_date)
      
end

    def find_book
      @book = Book.find(params[:id])

    end
end