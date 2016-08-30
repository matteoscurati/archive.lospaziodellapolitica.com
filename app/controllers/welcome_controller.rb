class WelcomeController < ApplicationController
  def index
    @articles_sample = Article.all.sample

    if params[:q].nil?
      @articles = []
    else
      @articles = Article.search(
        params[:q],
        fields: ["title^10", "content", "author_name^12", "date"],
        misspellings: {below: 5},
        operator: "or"
      )
    end
  end
end
