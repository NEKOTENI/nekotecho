class TagsController < ApplicationController

  def index
    @tags = Tag.where(user_id: current_user.id)
  end

  def new
    @tags = Tag.where(user_id: current_user.id)
  end

  def create
    Tag.create!(tag: params[:tag], user_id: current_user.id)
    redirect_to(:timeline)
  end

end
