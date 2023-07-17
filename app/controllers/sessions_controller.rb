class SessionsController < ApplicationController

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

end
