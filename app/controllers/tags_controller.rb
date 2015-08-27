class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def new
    @tags = Tag.all
  end

  def create
    Tag.create!(tag: params[:tag])
    redirect_to(:timeline)
  end

end
