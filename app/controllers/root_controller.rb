class RootController < ApplicationController
    before_action :require_user
    
    def index
        @message = Message.new
        @messages = Message.all
        render 'index'
    end
end
