class SubmissionsController < ApplicationController
  before_action :check_logged_in, only: [:new, :create]

  def index
    @submissions = Submission.all
  end

  def show
    @submission = Submission.find(params[:id])
    @comment = Comment.new 
    @rating = Rating.new
  end

  def new
    @submission = Submission.new
  end

  def create
    @submission = Submission.new(submission_params)
    @submission.user_id = current_user.id
    if @submission.save
      redirect_to @submission,
      notice: "This Jawn Has Been Saved"
    else
      render :new
    end
  end

  private
    def submission_params
      params.require(:submission).permit(:title, :description, :url, :screenshot)
    end

    def check_logged_in
      if !user_signed_in?
        redirect_to root_path,
        notice: "You need to sign in to do this"
      end
    end
end
