class UsersController < ApplicationController

    skip_before_action :authorized, only: [:new, :create, :welcome]
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to '/books' , notice: "Bem vindo!"
        else
            render "new"
        end
    end

    private 
    def user_params
      params.require(:user).permit(:email, :password)
    end

end
