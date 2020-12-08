class BooksController < ApplicationController
  
  def index
    
    @user = User.find_by(id: session[:user_id])

    @booksUser = BookUser.where(user_id: session[:user_id])

    @books = Book.find(@booksUser.map(&:book_id))

  end

  def show
    @book = Book.find(params[:id])
  end
  
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @user = User.find_by(id: session[:user_id])
    @book_user = BookUser.new

    if @book.save
      puts @book.id
      @book_user.book = @book
      @book_user.user = @user
      @book_user.save
      redirect_to @book
    else
      render 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_path
  end

  private 
    def book_params
      params.require(:book).permit(:title, :author)
    end
end
