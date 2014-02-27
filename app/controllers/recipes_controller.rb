class RecipesController < ApplicationController
  
  def index
    @recipes = Recipe.all
  end
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:notice] = "A new chef was created."
      redirect_to recipe_path(@recipe.id)
    else
      flash[:error] = "There was a problem saving your record."
      render :new
    end
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(recipe_params)
      flash[:notice] = "Your Recipe has been updated."
      redirect_to recipe_path(@recipe.id)
    else
      flash[:error] = "There was a problem saving your record."
      render :edit
    end
  end
  
  def show
    @recipe = Recipe.find(params[:id])
  end
  
  private
  
  def recipe_params
    params.require(:recipe).permit(:title, :description, :cook_time, :instructions, :ingredients, :picture)
  end
  
end
