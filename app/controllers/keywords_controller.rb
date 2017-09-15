class KeywordsController < ApplicationController

  def index
  end

  def troll
    @submissions = Submission.order(troll: :desc)
    render "submissions/index"
  end

  def funny
    @submissions = Submission.all.order(funny: :desc)
    render 'submissions/index'
  end

  def helpful
    @submissions = Submission.all.order(helpful: :desc)
    render 'submissions/index'
  end

  def story
    @submissions = Submission.all.order(story: :desc)
    render 'submissions/index'
  end
end
