class SessionsController < ApplicationController

    def new
        render 'new'
    end

    def create
        user = User.find_by(username: params[:session][:username])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash.now[:success]="You have succesfully logged in"
            redirect_to root_path
        else 
            flash.now[:error]="THere was something wrong with your login informations"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash.now[:success]="You have succesfully logged out"
        redirect_to login_path
    end

end
