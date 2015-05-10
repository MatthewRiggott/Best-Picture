class VotesController < ApplicationController

  def create
    photo = Photo.find(params[:photo])

    vote = Vote.new(user_id: 1, photo_id: params[:photo], contest_id: params[:contest_id])
      if vote.save
        photo.vote_count += 1
        photo.save
        redirect_to user_path(current_user)
      else
        render :new
      end
  end
end

# {"_method"=>"post", "photo"=>"2", "controller"=>"votes", "action"=>"create", "contest_id"=>"1"}
