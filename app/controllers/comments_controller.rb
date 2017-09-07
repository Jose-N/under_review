class CommentsController < ApplicationController
  def create
    @submission = Submission.find(params[:submission_id])
    @comment = Comment.new(comment_params)
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
      params.require(:comment).permit(:user_id, :body)
    end
end
