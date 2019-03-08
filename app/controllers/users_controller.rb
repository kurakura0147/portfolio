class UsersController < ApplicationController

#ユーザー情報詳細 users_path
  def index
  end

#投稿記事一覧 user_path
  def show

  if params[:params_content]
    @find_user = Content.find(params[:id]).user_id
    @contents = Content.where(user_id: @find_user)
    @article_user = User.find(@find_user)
  else
    # params_user の場合
    @contents = Content.where(user_id: params[:id])
    @article_user = User.find(params[:id])
  end

  end

end
