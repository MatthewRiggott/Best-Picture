class ContestsController < ApplicationController
  before_action :set_contest, only: [:show, :edit, :update, :destroy]

  def index
    @contests = Contest.all
  end

  def show
    @contest = Contest.find(params[:id])
    @photos = @contest.photos
  end

  def new
    @contest = Contest.new
  end

  def edit
  end

  def create
    # TODO need to add error messaging when a user tries to create a second contest. Can't do that currently.
    @contest = Contest.new(user_id: current_user.id)

    if @contest.save
      redirect_to @contest, notice: 'Contest was successfully created.'
    else
      render :new
    end
  end

  def update
    if @contest.update(contest_params)
      redirect_to @contest, notice: 'Contest was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @contest.destroy
      redirect_to contests_url, notice: 'Contest was successfully destroyed.'
    end
  end

  private
    def set_contest
      @contest = Contest.find(params[:id])
    end
end
