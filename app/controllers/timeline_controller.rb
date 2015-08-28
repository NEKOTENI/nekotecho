class TimelineController < ApplicationController

	def index
    @memos = Memo.where(user_id: current_user.id).order("id DESC")
    @tags = Tag.where(user_id: current_user.id)
	end

  def new
    @tags = Tag.where(user_id: current_user.id)
  end

  def create
    memo = Memo.create!(text: params[:text], image: params[:image], user_id: current_user.id)
    params[:tag_id].each do |tag|
      Tagging.create!(memo_id: memo.id, tag_id: tag)
    end
    redirect_to(:timeline)
  end

end
