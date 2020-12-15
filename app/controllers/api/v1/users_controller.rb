class Api::V1::UsersController < ApplicationController

    before_action :set_user, only: [:show, :destroy]

    def create
        user = User.new(user_params)
        if user.save
            render json: UserSerializer.new(user)
        else
            render json: {error: user.errors.full_messages} 
        end
    end

    def show
        if @user
            render json: UserSerializer.new(@user)
        else
            render json: {error: @user.errors.full_messages}
        end
    end

    def update
        user = User.find(params[:user][:user_id])
        if user.update(user_params)
       
            render json: UserSerializer.new(user)
        else
            render json: {error: user.errors.full_messages}
        end
    end

    private

    def set_user
        @user = User.find_by(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :affliction)
    end

end
