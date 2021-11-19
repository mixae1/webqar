class PostsController < ApplicationController
  def index

  end

  def new

  end

  def create

  end

  def show

  end

  def edit

  end

  def update
    case verb
    when :patch

    when :put

    else
      throw Exception.new
    end
  end

  def destroy

  end
end
