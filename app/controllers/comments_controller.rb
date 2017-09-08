class CommentsController < ApplicationController
  before_action :check_logged_in, only: [:create]


  def create
    @submission = Submission.find(params[:submission_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.submission = @submission
    if @comment.save
      redirect_to @submission,
      notice: "This Jawn Has Been Saved"
    else
      render :'submissions/show'
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end

    def check_logged_in
      if !user_signed_in?
        redirect_to root_path,
        notice: "You need to sign in to do this"
      end
    end
end
