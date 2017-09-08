class CommentsController < ApplicationController
  def create
    @submission = Submission.find(params[:submission_id])
    @comment = Comment.new(comment_params)
    @comment.submission = @submission
    @rating = Rating.new(rating_params)
    @rating.comment = @comment
    @rating.submission = @submission
    if @comment.save
      if @rating.save
      redirect_to @submission,
      notice: "This Jawn Has Been Saved"
      end
    else
      render :'submissions/show'
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:user_id, :body, :rating_id)
    end

    def rating_params
      params.require(:rating).permit(:troll, :funny, :story, :helpful)
    end
end
