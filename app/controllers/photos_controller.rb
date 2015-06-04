class PhotosController < ApplicationController

  def index
    @contest = Contest.find(params[:contest_id])
    @photos = current_user.photos
  end

  def update
    # Yes I know edit and update are exactly the same. Trying to get Ajax to work right
    @contest = Contest.find(params[:contest_id])
    photo = Photo.find(params[:id])
    photo.update(contest_id: @contest.id)
    if @contest.max_pics
      redirect_to edit_contest_path(@contest)
    else
      redirect_to contest_photos_path(@contest)
    end
  end

  def edit
    @contest = Contest.find(params[:contest_id])
    photo = Photo.find(params[:id])
    photo.update(contest_id: @contest.id)
    if @contest.max_pics
      redirect_to edit_contest_path(@contest)
    else
      redirect_to contest_photos_path(@contest)
    end
  end
end
