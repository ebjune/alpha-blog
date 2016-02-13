class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_show(@article)
  end

  def show
    
  end
  
  private

  def article_params
    # This is whitelisting values that you want to pass to the view
    params.require(:article).permit(:title, :description)
  end

end