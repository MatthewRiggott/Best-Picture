class VotesController < ApplicationController

  def create
    photo = Photo.find(params[:photo])
    contest = Contest.find(params[:contest_id])
    vote = Vote.new(user_id: current_user.id, photo_id: params[:photo], contest_id: params[:contest_id])
      if vote.save
        photo.vote_count += 1
        photo.save
        # TODO instead of sending them to a random contest after voting, should go to a random contest they *haven't* voted on yet.
        redirect_to contest_path(Contest.all.sample)
      else
        render :new
      end
  end
end
