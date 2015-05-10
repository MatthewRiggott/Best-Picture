class PhotosController < ApplicationController


  def index
    @contest = params[:contest_id]
    @photos = current_user.photos

  end

  def update
    binding.pry
    render :new
  end

  def edit
    @contest = Contest.find(params[:contest_id])
    photo = Photo.find(params[:id])
    photo.update(contest_id: @contest.id)
    redirect_to contest_photos_path(@contest)
  end
end
