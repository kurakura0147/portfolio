class UsersController < ApplicationController

#ユーザー情報詳細 users_path
  def index
  end

#投稿記事一覧 user_path
  def show
    @article_user = User.find(params[:id])
    @contents = Content.where(user_id: params[:id])
  end

end
