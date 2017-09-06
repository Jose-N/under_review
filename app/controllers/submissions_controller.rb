class SubmissionsController < ApplicationController
  def index
    @submissions = Submission.all
  end

  def new
    @submission = Submission.new
  end

  def create
    @submission = Submission.new(submission_params)
    if @submission.save
      redirect_to @submission,
      notice: "This Jawn Has Been Saved"  
    else
      render :new
    end
  end

  private
    def submission_params
      params.require(:submission).permit(:user_id, :title, :description, :url, :screenshot)
    end
end
