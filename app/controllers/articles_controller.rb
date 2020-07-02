class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show] 

    def index
        @articles = Article.all
    end
    def show
      @article = Article.find(params[:id])
    end
    
    def new
      @article = current_user.articles.new
    end

    def edit
      @article = current_user.articles.find(params[:id])
    end

    def new_comment
      @article = Article.find(params[:id])
      comment = @article.comments.new(text: params[:comment][:text])
      if comment.save
        flash[:notice] = "Comment successfully created"
      else
        flash[:alert] = "Comment fail... try again!"
      end
      redirect_to article_path(@article)
    end
    

    def create
      @article = current_user.articles.new(article_params)
      if @article.save
        flash[:notice] = "successfully created"
        redirect_to article_path(@article)
      else
        flash[:alert] = "Article fail... try again!"
        render :new
      end
    end

    def update
      @article = current_user.articles.find(params[:id])
      @article.update_attributes(article_params)
      if @article.save
        flash[:notice] = "successfully created"
        redirect_to article_path(@article)
      else
        flash[:alert] = "Article fail... try again!"
        render :edit
      end
    end
       
  private
    def article_params
      params.require(:article).permit(:title, :text, :subtitle)
    end
end
