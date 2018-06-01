class SessionController < ApplicationController

    def index

    end
    def create
        
        puts params[:session]
        
        user_data = params[:session]
        @user = User.find_by(email: user_data[:email])
        puts "out"
        if @user.present?
            puts "in"
            if @user.google_token == user_data[:google_token]
            puts "in2"
                session[:user_id] = @user.id
                cookies[:token] = @user.google_token
            redirect_to root_path, notice: "Thank you for SignUp"
            else
            redirect_to login_path
            end
        else
            @new_user =  User.new
            @new_user.name = user_data[:name]
            @new_user.email = user_data[:email]
            @new_user.google_token = user_data[:google_token]
            if @new_user.save
                session[:user_id] = @new_user.id
                cookies[:token] = @new_user.google_token
            redirect_to root_path, notice: "Thank you for SignUp"
            else
            redirect_to login_path
            end
        end
    end

    def fb_login
        puts params[:session]

        user_data = params[:session]
        @user = User.find_by(facebook_token: user_data[:facebook_token])
        if @user.present?
            session[:user_id] = @user.id
            cookies[:token] = @user.facebook_token
            redirect_to root_path, notice: "Thank you for SignUp" 
        else
            @new_user = User.new
            @new_user.name = user_data[:name]
            @new_user.facebook_token = user_data[:facebook_token]
            if @new_user.save
                session[:user_id] = @new_user.id
                cookies[:token] = @new_user.facebook_token
            redirect_to root_path, notice: "Thank you for SignUp"
            else
            redirect_to login_path
            end
        end
    end

    def logout
        session[:user_id] = nil
        cookies[:token] = nil
        redirect_to login_path
    end
end
