class Api::V1::MedicinesController < ApplicationController

before_action :set_user

def index
    medicines = @user.medicines
    render json: MedicineSerializer.new(medicines)
end

def create
    medicine = @user.medicines.build(medicine_params)
    if medicine.save
        render json: medicine
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
    if medicine.update(medicine_params)
        render json: medicine
    else
        render json: { error: "Unable to update medicine" }
    end
end

def destroy
    medicine = @user.medicines.find(params[:id])
    if medicine.destroy
        render json: medicine
    else
        render json: { error: "Medicine could not be destroyed" }
    end
end

private

def set_user
    @user = User.find(params[:user_id])
end

def medicine_params
    params.require(:medicine).permit(:user_id, :name, :dosage, :note )
end

end
