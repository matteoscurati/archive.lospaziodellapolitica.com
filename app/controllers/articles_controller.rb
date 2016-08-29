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
end
