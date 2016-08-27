class AuthorsController < ApplicationController
  def index
    @authors = Author.ordered_by_articles
  end

  def articles
    @author = Author.find(params[:id])
    @articles = @author.articles.created
  end
end
