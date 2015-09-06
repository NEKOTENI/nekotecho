class UserSessionsController < ApplicationController
  skip_before_filter :require_login, except:[:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_to(:timeline, notice: 'ログインしました')
    else
      flash.now[:alert] = 'ログインに失敗しました'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:root, notice: 'ログアウトしました')
  end
end
