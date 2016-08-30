class WelcomeController < ApplicationController
  def index
    @articles_sample = Article.all.sample

    if params[:q].nil?
      @articles = []
    else
      @articles = Article.search(
        params[:q],
        fields: ["title^10", "content", "author_name^10", "date"],
        misspellings: {below: 2},
        operator: "or"
      )
    end
  end
end
