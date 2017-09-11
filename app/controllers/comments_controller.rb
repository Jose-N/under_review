class CommentsController < ApplicationController
  before_action :check_logged_in, only: [:create]

  def create
    @submission = Submission.find(params[:submission_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.submission = @submission
    @rating = Rating.new(rating_params)
    @rating.user_id = current_user.id
    @rating.comment = @comment
    @rating.submission = @submission
    if @comment.save
      if @rating.save
        CommentMailer.new_comment(@rating).deliver_now
        redirect_to @submission,
        notice: "This Jawn Has Been Saved"
      end
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
      params.require(:comment).permit(:body)
    end

    def rating_params
      params.require(:rating).permit(:troll, :funny, :story, :helpful)
    end
end
