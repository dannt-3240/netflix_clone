class Admin::MoviesController < Admin::AdminController
  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new movie_params
    if @movie.save
      flash[:success] = t(".success")
      redirect_to new_admin_movie_path
    else
      flash.now[:danger] = t(".danger")
      render :new
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:duration, :name, :release_year)
  end
end
