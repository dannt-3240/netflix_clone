class Admin::MoviesController < Admin::AdminController
  def new
    @movie = Movie.new
  end

  def index
    @movie = Movie.last
  end

  def show
    @movie = Movie.find params[:id]
  end

  def create
    @movie = Movie.new movie_params

    if @movie.save
      flash[:success] = t(".success")
      # redirect_to admin_movie_path(@movie.id)
      redirect_to new_admin_movie_path

    else
      flash.now[:danger] = t(".danger")
      render :new
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:duration, :name, :release_year, :poster, :thumbnail, movie_video_attributes: [:video_url, :server_name, :server_order]).tap do |attr|
      attr[:movie_video_attributes][:video_url] = get_video_url(attr[:movie_video_attributes][:video_url])
    end
  end

  def get_video_url(file)
    upload_info = {
      title: generate_unique_filename(file.original_filename),
      parent_ids: [{ id: '1cuBlSwFTsUMfdSMUGMN-5GFbgCNXLoQ7' }],
      path: file.tempfile.path
    }

    upload_result = $drive.upload(upload_info)
  end

  def generate_unique_filename(original_filename)
    random_string = SecureRandom.hex(8)
    timestamp = Time.now.strftime('%Y%m%d%H%M%S')
    "#{timestamp}_#{random_string}#{original_filename}"
  end
end
