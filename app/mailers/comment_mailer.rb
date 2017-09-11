class CommentMailer < ApplicationMailer
  def new_comment(rating)
    @rating = rating

    mail(
      to: rating.user.email,
      subject: "New Review for #{rating.submission.title}"
    )
  end
end
