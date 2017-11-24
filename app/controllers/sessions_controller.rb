class SessionsController < ApplicationController

    def new
    end

    def create
        account = Account.find_by_email(params[:email])
        if account && Account.authenticate(params[:email], params[:password])
            session[:account_id] = account.id
            redirect_to home_path, notice: "Logged in!"
        else
            flash.now.alert = "Email or password is invalid"
            render "new"
        end
    end

    def destroy
        session[:account_id] = nil
        redirect_to home_path, notice: "Logged out!"
    end
end
