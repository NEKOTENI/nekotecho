class TimelineController < ApplicationController

	def index
    @memos = Memo.where(user_id: current_user.id).order("id DESC")
    @tags = Tag.all
    # @users = User.all
	end

  def new
  end

  def create
    Memo.create!(text: params[:text], image: params[:image], user_id: current_user.id)
    redirect_to(:timeline)
  end

end
