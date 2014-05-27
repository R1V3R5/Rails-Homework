class FruitsController < ApplicationController
  respond_to :html

  def index
  end

  def new
    @fruit = Fruit.new 
    respond_with @fruit
  end

  def create
    @fruit = Fruit.new fruit_params  
    
    if @fruit.save
      respond_with @fruit, location: fruits_path
    else
      render :new
    end
  end
  
  def edit
    @fruit = Fruit.find params[:id]
    respond_with @fruit
  end

  def update
    @fruit = Fruit.find params[:id]
    @fruit.update_attributes fruit_params
    respond_with @fruit

  end

  # def destroy

  # end

  def show
    @fruit = Fruit.all 
  end

  private
    def fruit_params
      params.require(:fruit).permit(:name)
    end
end
