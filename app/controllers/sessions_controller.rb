class SessionsController < ApplicationController
    before_action :logged_in_redirect, only: [:new, :create]

    def new
        render 'new'
    end

    def create
        user = User.find_by(username: params[:session][:username])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: "You have succesfully logged in"
        else 
            render 'new', notice: "THere was something wrong with your login informations"
        end
    end

    def destroy
        session[:user_id] = nil
        flash.now[:success]="You have succesfully logged out"
        redirect_to login_path
    end

    private

    def logged_in_redirect
        if logged_in?
            redirect_to root_path, notice: "You've alredy logged in"
        end
    end

end
