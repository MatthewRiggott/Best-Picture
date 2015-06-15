class ContestsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show]
  before_action :set_contest, only: [:show, :edit, :update, :destroy]

  def index
    @contests = Contest.all
  end

  def show
    @contest = Contest.find(params[:id])
    @photos = @contest.photos
  end

  def new
    @contest = Contest.new(user_id: current_user.id)
    if @contest.save
       redirect_to contest_photos_path(@contest)
    else
      if current_user.contests.exists?
        redirect_to root_path, notice: 'You\'ve already created a contest. Delete your contest if you want to make a new one.'
      else
        redirect_to root_path, notice: 'Something went wrong'
      end
    end
  end

  def edit
    @photos = @contest.photos
  end

  def create
    # TODO need to add error messaging when a user tries to create a second contest. Can't do that currently.
    # TODO also need to migrate #new functionality to #create for good RESTful design
    @contest = Contest.new(user_id: current_user.id)

    if @contest.save
      redirect_to @contest, notice: 'Contest was successfully created.'
    else
      render :new
    end
  end

  def update
    # Using edit rather than update because I'm not sure how PATCH requests work with AJAX
    # You are a noob.
    binding.pry
    @contest = Contest.find(params[:contest_id])
    if params[:selectedPhotos].count != 4
      render :index, notice: "Please select 4 photos before submitting"
    else
      params[:selectedPhotos].each do |photo|
        ruby_photo_object = Photo.find(photo.to_i)
        ruby_photo_object.update(contest_id: @contest.id)
      end
      vote_contest = Contest.random_contest(current_user)

      if vote_contest
        redirect_to contest_path(Contest)
      else
        binding.pry
        redirect_to user_path(current_user)
      end
    end
  end

  def destroy
    @destroyed = @contest.destroy
    if @destroyed
      photos = @destroyed.photos
      ArchivedContest.transaction do
        old_contest = ArchivedContest.create(user: current_user)
        photos.each do |photo|
          ArchivedVote.create(photo: photo, votes: photo.vote_count, archived_contest_id: old_contest.id)
        end
      end
      redirect_to user_path(current_user), notice: 'Contest was successfully destroyed.'
    end
  end

  private
    def set_contest
      @contest = Contest.find(params[:id])
    end

end
