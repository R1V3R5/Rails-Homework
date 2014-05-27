class HomeController < ApplicationController
  respond_to :html
  def index
    @blog_entry = Post.all
  end
end
