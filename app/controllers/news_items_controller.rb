class NewsItemsController < ApplicationController
  def index
    @news = NewsItem.all
  end

  def show
    @news_item = NewsItem.find(params[:id])
  end

  def find
    item = NewsItem.find_by_url_key(params[:key])
    if item
      redirect_to news_path(item), status: 301
    else
      redirect_to news_index_path, flash: { error: "Page doesn't exist." }
    end
  end
end