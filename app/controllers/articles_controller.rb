class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @articles = Article.created
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  private
  def article_params
    params.require(:article).permit(:content, :title)
  end

end
