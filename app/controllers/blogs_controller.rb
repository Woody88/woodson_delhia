class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end
end
