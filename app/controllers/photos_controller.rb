class PhotosController < ApplicationController

  def index
    @contest = Contest.find(params[:contest_id])
    @photos = current_user.photos
  end

  def update
  end

  def edit
  end
end
