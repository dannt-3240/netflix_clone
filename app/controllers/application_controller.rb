class ApplicationController < ActionController::Base
  before_action :google_login, except: [:set_google_drive_token]

  def google_login
    unless $drive.get_credentials
      redirect_to('/oauth2callback')
    end
  end

  def after_sign_in_path_for(resource)
    if resource.admin?
      new_admin_movie_path
    else
      home_index_path
    end
  end
end
