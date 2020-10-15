class UsersController < ApplicationController

    before_action :set_user

    def index
        users = User.all 
        return json: users
    end

    def show
        return json: @user
    end


    def create
        user = User.new(user_params)
        if user.save
            return json: user
        else
            return json: {error: "User could not be created"}
        end
    end

    def update
        if @user.update
            return json: @user
        else
            return json: {error: "User could not be updated"}
        end
    end

    def delete
        @current_user.destroy
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :affliction)
    end

end
