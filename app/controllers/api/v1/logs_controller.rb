class Api::V1::LogsController < ApplicationController

    before_action :set_user

    def index
        logs = @user.logs
        render json: LogSerializer.new(logs)
    end

    def create
        log = @user.logs.build(log_params)
        if log.save
            render json: log
        else
            render json: { error: "Log could not be created" }
        end
    end

    def show
        log = Log.find(params[:id])
        render json: LogSerializer.new(log)
    end

    def update
        log = Log.find(params[:id])
        if log.update(log_params)
            render json: log
        else
            render json: { error: "Log could not be updated" }
        end
    end

    def destroy
        log = @user.logs.find(params[:id])
        if log.destroy
            render json: log
        else 
            render json: { error: "Log could not be destroyed" }
        end
    end

    private

    def set_user
        @user = User.find(params[:user_id])
    end

    def log_params
        params.require(:log).permit(:date, :medicine, :symptom_level, :note, :user_id)
    end

end
