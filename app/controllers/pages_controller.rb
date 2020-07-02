class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    if params[:id] && template_exists?(params[:id], ["pages"])
      load_variable
      render params[:id]
    else
      redirect_to '/404.html', :status => 404
    end
  end

  private

  def load_variable
    if params[:id] == "home"
      @articles_home = Article.limit(30).order(created_at: :desc)
    end
  end
  
end