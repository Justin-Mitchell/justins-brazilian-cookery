module RecipesHelper
  
  def options_for_chefs
    chefs = Chef.all
    list_options = []
    chefs.each do |c|
      list_options << [c.name, c.id]
    end
    list_options
  end
  
end
