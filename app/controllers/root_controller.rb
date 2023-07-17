class RootController < ApplicationController
    before_action :require_user
    
    def index
        @messages = Message.all
        render 'index'
    end
end
