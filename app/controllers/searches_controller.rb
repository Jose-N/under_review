class SearchesController < ApplicationController

  def index
  end

  def result
    if params[:search]
      @results = []
      @results.concat(Submission.where('title ilike ?',  "%#{params[:search]}%"))
      @results.concat(Submission.where('description ilike ?', "%#{params[:search]}"))
      @results = @results.uniq
    end
  end
end
