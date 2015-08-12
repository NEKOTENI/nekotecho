class TimelineController < ApplicationController

	def index
    @memos = Memo.all
    @tags = Tag.all
    @users = User.all
	end
end
