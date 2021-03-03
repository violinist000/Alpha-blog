class SessionsController < ApplicationController
    
    def new
    end
    
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "Logged in successfully"
            redirect_to user
        else
            flash.now[:alert] = "Oops looks like you didn't put in the right information"
            render 'new'
        end
    end
    
    def destroy
        session[:user_id] = nil
        flash[:notice] = "You have left :'("
        redirect_to root_path
    end
end