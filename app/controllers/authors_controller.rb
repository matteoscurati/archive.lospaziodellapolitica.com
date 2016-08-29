class AuthorsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]
  def index
    @authors = Author.ordered_by_articles
  end

  def articles
    @author = Author.find(params[:id])
    @articles = @author.articles.created
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to authors_path
  end
end
