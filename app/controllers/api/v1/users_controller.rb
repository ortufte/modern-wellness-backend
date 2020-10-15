class Api::V1::UsersController < ApplicationController

    before_action :set_user

    def index
        users = User.all 
        render json: users
    end

    def show
        render json: @user
    end


    def create
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: {error: "User could not be created"}
        end
    end

    def update
        if @user.update
            render json: @user
        else
            render json: {error: "User could not be updated"}
        end
    end

    def delete
        @current_user.destroy
    end

    private

    def set_user
        @user = User.find_by(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :affliction)
    end

end
