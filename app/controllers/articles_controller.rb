class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end
    def show
      @article = Article.find(params[:id])
    end
    
    def new
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
        @article = Article.new(article_params)
 
        @article.save
        redirect_to @article
      end
       
      private
        def article_params
          params.require(:article).permit(:title, :text)
        end
end
