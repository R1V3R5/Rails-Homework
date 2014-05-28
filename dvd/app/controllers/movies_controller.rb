class MoviesController < ApplicationController
  before_filter :find_movie, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new movie_params
    if @movie.save
      flash[:notice] = "You successfully saved this DVD!"
      redirect_to root_path
    else
      flash[:error] = "You were unsuccessful saving this DVD"
      render :new
    end
  end

  def edit
  end

  def update
    if @movie.update_attributes movie_params
      flash[:notice] = "You successfully updated this DVD!"
      redirect_to root_path
    else
      flash[:error] = "You were unsuccessful updated this DVD"
      render :edit
    end
  end

  def destroy
    @movie.delete
    redirect_to root_path
  end

  private
    def movie_params
        params.require(:movie).permit(:title, :release_year, :genre, :rating, :runtime, :actors, :favorite)
    end

    def find_movie
      @movie = Movie.find params[:id]
    end

end
