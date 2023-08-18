class Admin::MoviesController < Admin::AdminController
  def new
    @movie = Movie.new
  end

  def index
    @movie = Movie.last
  end

  def show
    @movie = Movie.last
  end

  def create
    upload_poster = movie_params[:poster]

    upload_info = {
      title: upload_poster.original_filename,
      parent_ids: [{ id: '1cuBlSwFTsUMfdSMUGMN-5GFbgCNXLoQ7' }],
      path: upload_poster.tempfile.path
    }

    upload_poster_image = $drive.upload(upload_info)
    data_link = $drive.get(upload_poster_image).alternate_link
    new_params = movie_params.merge(poster: data_link)
    @movie = Movie.new new_params

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
    params.require(:movie).permit(:duration, :name, :release_year, :poster)
  end
end
