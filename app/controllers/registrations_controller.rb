class RegistrationsController < ApplicationController 
    def new
        @user = User.new 
    end 

    def create 
        @user = User.new(user_params)
        existing_user = User.find_by(email: @user.email)
        if existing_user
            flash[:alert] = "Email address is already in use"
            render :new
        elsif @user.save
            session[:user_id] = @user.id
            flash[:notice] = "User created successfully"
            redirect_to root_path 
        else
            render :new
        end
    end 

    private 

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end 
end
