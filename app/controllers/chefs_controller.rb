# frozen_string_literal: true

class ChefsController < ApplicationController
  before_action :set_chef, only: [:show]

  def new
    @chef = Chef.new
  end

  def show; end

  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      flash[:success] = 'Chef was Sign up successfully!'
      redirect_to chef_path(@chef)
    else
      render 'new'
    end
  end

  private

  def set_chef
    @chef = Chef.find(params[:id])
  end

  def chef_params
    params.require(:chef).permit(:chef_name, :email, :password, :confirm_password)
  end
end
