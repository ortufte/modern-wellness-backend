class Api::V1::SessionsController < ApplicationController

    def create
        @user = User.find_by(email: params[:session][:email])

        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id

            render json: UserSerializer.new(@user)
        else
            render json: { error: "User not found"}
        end

    end

    def get_current_user 
        if logged_in? 
            render json: current_user
        else
            render json: {error: "Not Logged In"}
        end
    end

# hitting this action but not working - json not rendering
    def destroy
        if session.clear
           # byebug #hits byebug so it is clearing - session[:user_id] is nil
            render json: {notice: "Yay!"}
        else
            render json: {notice: "Nope" }
        end
    end


 end
