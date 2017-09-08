class CommentsController < ApplicationController
  before_action :check_logged_in, only: [:create]


  def create
    @submission = Submission.find(params[:submission_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
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
      params.require(:comment).permit(:body)
    end

    def rating_params
      params.require(:rating).permit(:troll, :funny, :story, :helpful)
    end

    def check_logged_in
      if !user_signed_in?
        redirect_to root_path,
        notice: "You need to sign in to do this"
      end
    end
end
