class CommentMailer < ApplicationMailer
  def new_comment(comment)
    @comment = comment

    mail(
      to: comment.user.email,
      subject: "New Review for #{comment.submission.title}"
    )
  end
end
