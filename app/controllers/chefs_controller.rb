# frozen_string_literal: true

class ChefsController < ApplicationController
  before_action :set_chef, only: %i[show edit update]

  def index
    @chefs = Chef.paginate(page: params[:page], per_page: 5)
  end

  def new
    @chef = Chef.new
  end

  def show
    @chef_recipes = @chef.recipes.paginate(page: params[:page], per_page: 5)
  end

  def edit; end

  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      flash[:success] = 'Chef was Sign up successfully!'
      redirect_to chef_path(@chef)
    else
      render 'new'
    end
  end

  def update
    if @chef.update(chef_params)
      flash[:success] = 'Chef was updated successfully!'
      redirect_to @chef
    else
      render 'edit'
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
