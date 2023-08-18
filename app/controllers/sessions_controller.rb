class SessionsController < ApplicationController
  def set_google_drive_token
    if request['code'] == nil
      redirect_to($drive.authorization_url, allow_other_host: true)
    else
      $drive.save_credentials(request['code'])
      redirect_to('/', allow_other_host: true)
    end
  end
end
