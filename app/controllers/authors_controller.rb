class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def articles
    @author = Author.find(params[:id])
    @articles = @author.articles
  end
end
