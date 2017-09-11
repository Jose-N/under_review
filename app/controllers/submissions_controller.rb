class SubmissionsController < ApplicationController
  before_action :check_logged_in, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_submission, only: [:show, :edit, :update, :destroy]
  before_action :check_authorized, only: [:edit, :update, :destroy]

  def index
    @submissions = Submission.all
  end

  def show
    @comment = Comment.new
    @rating = Rating.new
  end

  def new
    @submission = Submission.new
    @rating =Rating.new
    @comment = Comment.new
  end

  def create
    @submission = Submission.new(submission_params)
    @submission.user_id = current_user.id
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.submission = @submission
    @rating = Rating.new(rating_params)
    @rating.user_id = current_user.id
    @rating.submission = @submission
    @rating.comment = @comment
    if @rating.save && @submission.save && @comment.save
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
      params.require(:submission).permit(:title, :url, :screenshot)
    end

    def rating_params
      params.require(:rating).permit(:troll, :funny, :story, :helpful)
    end

    def comment_params
      params.require(:comment).permit(:body)
    end

    def edit_params
      params.require(:submission).permit(:title)
    end

    def check_authorized
      if !current_user.admin && current_user.id != @submission.user_id
        redirect_to root_path,
        notice: "You are not authorized to do that"
      end
    end
end
