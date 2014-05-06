require 'dropbox_sdk'

class DropboxesController < ApplicationController
  def main
    client = get_dropbox_client
    unless client
      redirect_to('/auth/dropbox_oauth2') and return
    end

    ap client.metadata('/public')

    @account_info = client.account_info
  end

  def upload
    client = get_dropbox_client
    unless client
      redirect_to(:action => 'auth_start') and return
    end

    begin
      # Upload the POST'd file to Dropbox, keeping the same name
      resp = client.file_create_folder('../assets/','boner')
      render :text => "Upload successful.  File now at #{resp['path']}"
    rescue DropboxAuthError => e
      session.delete(:access_token)  # An auth error means the access token is probably bad
      logger.info "Dropbox auth error: #{e}"
      render :text => "Dropbox auth error"
    rescue DropboxError => e
      logger.info "Dropbox API error: #{e}"
      render :text => "Dropbox API error"
    end
  end

  def get_dropbox_client
    if session[:access_token]
      begin
        access_token = session[:access_token]
        DropboxClient.new(access_token)
      rescue
        # Maybe something's wrong with the access token?
        session.delete(:access_token)
        raise
      end
    end
  end
end
