class CommentsController < ApplicationController
  before_action :check_logged_in, only: [:create]

  def create
    @submission = Submission.find(params[:submission_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.submission = @submission
    if @comment.save
        CommentMailer.new_comment(@comment).deliver_now
        redirect_to @submission,
        notice: "This Jawn Has Been Saved"
    else
      render :'submissions/show'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @submission = @comment.submission
    @comment.destroy
    redirect_to submission_path(@submission),
    notice: 'This Jawn is gone'
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :troll, :funny, :story, :helpful)
    end
end
