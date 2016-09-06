class PostsController < ApplicationController
  def index
    @posts = Post.all
    CrawlerService.new.perform
  end
end
