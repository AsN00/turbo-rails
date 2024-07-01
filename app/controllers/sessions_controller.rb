class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.email = auth['info']['email']
      u.name = auth['info']['name']
    end

    session[:user_id] = user.id
    redirect_to root_path, notice: 'Signed in successfully'
  rescue StandardError => e
    redirect_to root_path, alert: "Authentication failed: #{e.message}"
  end

  def destroy
    session[:user_id] = nil
    redirect_to ENV['keycloak_logout_url'], allow_other_host: true
  end

  def failure
    redirect_to root_path, alert: 'Authentication failed.'
  end

def route_to_kc
  redirect_to ENV['kc_url']
end


end
