class SessionsController < ApplicationController

  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect_to '/books'
    else
       redirect_to '/login', notice: "Email ou senha inválido."
    end
  end

  def page_requires_login
  end

  def login
  end

  def welcome
  end
end
