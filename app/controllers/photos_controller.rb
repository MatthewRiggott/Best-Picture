class PhotosController < ApplicationController

  def index
    @contest = Contest.find(params[:contest_id])
    @photos = current_user.photos
  end

  def update
    # Using edit rather than update because I'm not sure how PATCH requests work with AJAX
    # You are a noob.
    @contest = Contest.find(params[:contest_id])
    if params[:selectedPhotos].count != 5
      render :index, notice: "Please select 5 photos before submitting"
    else
      params[:selectedPhotos].each do |photo|
        ruby_photo_object = Photo.find(photo.to_i)
        ruby_photo_object.update(contest_id: @contest.id)
      end
      vote_contest = Contest.random_contest(current_user)

      if vote_contest
        binding.pry
        redirect_to contest_path(Contest)
      else
        binding.pry
        redirect_to user_path(current_user)
      end
    end

  end

  def edit
    @contest = Contest.find(params[:contest_id])
    respond_to do |format|
      if format.json
        binding.pry
      end
    end
    if params[:selectedPhotos].count < 5
      render :index, notice: "Please select 5 photos before submitting"
    else
      params[:selectedPhotos].each do |photo|
        ruby_photo_object = Photo.find(photo.to_i)
        ruby_photo_object.update(contest_id: @contest.id)
      end
      binding.pry
      redirect_to root_path(@contest)
    end

    # photo = Photo.find(params[:id])
    # photo.update(contest_id: @contest.id)
    # if @contest.max_pics
    #   redirect_to edit_contest_path(@contest)
    # else
    #   redirect_to contest_photos_path(@contest)
    # end
  end
end
