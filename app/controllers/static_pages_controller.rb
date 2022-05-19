class StaticPagesController < ApplicationController
  require 'flickr'

  # GET /static_pages or /static_pages.json
  def index
    flickr = Flickr.new ENV["flickr_key"], ENV["flickr_secret"]
    unless params[:user_id].blank?
      @photos = flickr.photos.search(user_id: params[:user_id])
    else
      @photos = flickr.photos.getRecent
    end
  end
end
