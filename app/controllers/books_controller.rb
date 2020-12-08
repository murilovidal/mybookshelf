class BooksController < ApplicationController
  
  def index
    
    @user = User.find_by(id: session[:user_id])

    @booksUser = BookUser.where(user_id: session[:user_id])

    @books = Book.find(@booksUser.map(&:book_id))

  end

  def show
    @book = Book.find(params[:id])
    @booksUser = BookUser.find_by(user_id: session[:user_id], book_id: @book.id)
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
    @booksUser = BookUser.find_by(book_id: @book.id)
    @booksUser.delete
    @book.delete
    redirect_to books_path
  end

  def savereview
    @book = Book.find(params[:id])
    @user = User.find_by(id: session[:user_id])

    @booksUser = BookUser.find_by(user_id: session[:user_id], book_id: @book.id)
    @booksUser.review = params[:review]
    puts params[:review]
    @booksUser.save
    redirect_to @book
  end   
  
  def review
    @book = Book.find(params[:id])
  end

  private 
    def book_params
      params.require(:book).permit(:title, :author)
    end
end
