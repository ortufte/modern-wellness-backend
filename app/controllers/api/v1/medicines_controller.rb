class Api::V1::MedicinesController < ApplicationController

before_action :set_user

def index
    medicines = @user.medicines
    render json: MedicineSerializer.new(medicines)
end

def new
    medicine = @user.medicines.build(medicine_params)
    if medicine.save
        render json: MedicineSerializer.new(medicine)
    else
        render json: { error: "Unable to create medicine" }
    end
end

def show
    medicine = Medicine.find(params[:id])
    render json: MedicineSerializer.new(medicine)
end

def update
    medicine = Medicine.find(params[:id])
    if medicine.save
        render json: MedicineSerializer.new(medicine)
    else
        render json: { error: "Unable to update medicine" }
    end
end

def delete
    medicine = Medicine.find(params[:id])
    medicine.destory
end

private

def set_user
    @user = User.find(params[:user_id])
end

def medicine_params
    params.require(:medicine).permit(:user_id, :name, :dosage, :note )
end

end
