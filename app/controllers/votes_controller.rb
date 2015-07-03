class VotesController < ApplicationController
  def create
    photo = Photo.find(params[:photo])
    contest = Contest.find(params[:contest_id])
    vote = Vote.new(user_id: current_user.id, photo_id: params[:photo], contest_id: params[:contest_id])
      if vote.save
        photo.vote_count += 1
        photo.save
        next_contest = current_user.get_contest
        redirect_to contest_path(current_user.get_contest)
      else
        next_contest = current_user.get_contest
        redirect_to contest_path(current_user.get_contest), notice: vote.errors.messages[:user][0]
      end
  end
end
