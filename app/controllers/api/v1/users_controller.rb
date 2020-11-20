class Api::V1::UsersController < ApplicationController

    before_action :set_user, only: [:show, :update, :destroy]

    def index
        users = User.all 
        render json: UserSerializer.new(users)
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: UserSerializer.new(user)
        else
            render json: {error: "User could not be created"} 
        end
    end

    def show
        render json: UserSerializer.new(@user)
    end

    def update
        if @user.update
            render json: UserSerializer.new(@user)
        else
            render json: {error: "User could not be updated"}
        end
    end

    def delete
        @user.destroy
    end

    private

    def set_user
        @user = User.find_by(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :affliction)
    end

end
