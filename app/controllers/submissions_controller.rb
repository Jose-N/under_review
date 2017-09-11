class SubmissionsController < ApplicationController
  before_action :check_logged_in, only: [:new, :create, :edit, :update, :destroy]
  before_action :check_admin, only: [:edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]

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

  def edit
  end

  private
    def submission_params
      params.require(:submission).permit(:title, :description, :url, :screenshot)
    end

    def check_user
      if current_user.id != Submission.find(params[:id]).user.id
        redirect_to root_path,
        notice: "You cant do that"
      end
    end
end
