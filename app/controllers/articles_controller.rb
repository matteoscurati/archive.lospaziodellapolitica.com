class ArticlesController < ApplicationController
  def index
    @articles = Article.created
  end
  def show
    @article = Article.find(params[:id])
  end
end
