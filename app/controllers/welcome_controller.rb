class WelcomeController < ApplicationController
  def index
    @articles = Article.all.sample
  end
end
