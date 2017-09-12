class SubmissionsController < ApplicationController
  before_action :check_logged_in, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_submission, only: [:show, :edit, :update, :destroy]
  before_action :check_authorized, only: [:edit, :update, :destroy]
  before_action :average_ratings, only: [:show]

  def index
    @submissions = Submission.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @submission = Submission.new
  end

  def create
    @submission = Submission.new(submission_params)
    @submission.user_id = current_user.id
    if  @submission.save
      redirect_to @submission,
      notice: "This Jawn Has Been Saved"
    else
      render :new
    end
  end

  def destroy
    @submission.destroy
    redirect_to submissions_path,
    notice: "This Jawn is gone"
  end

  def edit
  end

  def update
    if @submission.update(edit_params)
      redirect_to @submission,
      notice: "This Jawn Has Been Saved"
    else
      render :edit
    end
  end

  private
    def set_submission
      @submission = Submission.find(params[:id])
    end

    def submission_params
      params.require(:submission).permit(:title, :description, :url, :screenshot, :troll, :funny, :story, :helpful)
    end

    def edit_params
      params.require(:submission).permit(:description, :title)
    end

    def check_authorized
      if !current_user.admin && current_user.id != @submission.user_id
        redirect_to root_path,
        notice: "You are not authorized to do that"
      end
    end

    def average_ratings
      @troll = @submission.troll
      @funny = @submission.funny
      @story = @submission.story
      @helpful = @submission.helpful
      if @submission.comments
        @submission.comments.each do |c|
          @troll = @troll + c.troll
          @funny = @funny + c.funny
          @story = @story + c.story
          @helpful = @helpful + c.helpful
        end
        @troll = @troll / (@submission.comments.count + 1)
        @funny = @funny / (@submission.comments.count + 1)
        @story = @story / (@submission.comments.count + 1)
        @helpful = @helpful / (@submission.comments.count + 1)
      end
    end
end
