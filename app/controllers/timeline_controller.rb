class TimelineController < ApplicationController

	def index
    if params[:tag_id]
      tag = Tag.find_by(id: params[:tag_id], user_id: current_user.id)
      @memos = tag.memos.order("id DESC") if tag
    else
      @memos = Memo.where(user_id: current_user.id).order("id DESC")
    end

    @tags = Tag.where(user_id: current_user.id)
	end

  def new
    @tags = Tag.where(user_id: current_user.id)
  end

  def create
    memo = Memo.create!(text: params[:text], image: params[:image], user_id: current_user.id)
    if params[:tag_id]
      tags = Tag.where(id: params[:tag_id], user_id: current_user.id)
      tags.each do |tag|
        Tagging.create!(memo_id: memo.id, tag_id: tag)
      end
    end
    redirect_to(:timeline)
  end

end
