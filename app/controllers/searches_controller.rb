class SearchesController < ApplicationController

  def index
  end

  def result
    if params[:search] && params[:search] != ''
      @results = []
      @results.concat(Submission.where('title ilike ?',  "%#{params[:search]}%"))
      @results.concat(Submission.where('description ilike ?', "%#{params[:search]}"))
      @results = @results.uniq
      if @results == []
        redirect_to searches_path,
        notice: "Sorry, we couldn't find this jawn."
      end
    else
      redirect_to searches_path,
      notice: 'Sorry, please enter a valid search.'
    end
  end
end
