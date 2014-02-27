class ChefsController < ApplicationController
  
  def index
    @chefs = Chef.all
  end
  
  def new
    @chef = Chef.new
  end
  
  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      flash[:notice] = "A new chef was created."
      redirect_to chef_path(@chef.id)
    else
      flash[:error] = "There was a problem saving your record."
      render :new
    end
  end
  
  def edit
    @chef = Chef.find(params[:id])
  end
  
  def update
    @chef = Chef.find(params[:id])
    if @chef.update_attributes(chef_params)
      flash[:notice] = "Your Chef has been updated."
      redirect_to chef_path(@chef.id)
    else
      flash[:error] = "There was a problem saving your record."
      render :edit
    end
  end
  
  def show
    @chef = Chef.find(params[:id])
  end
  
  private
  
  def chef_params
    params.require(:chef).permit(:name, :specialty, :tv_show, :photo)
  end
  
end
