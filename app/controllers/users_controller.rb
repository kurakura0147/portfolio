class UsersController < ApplicationController

  before_action :set_tags

#ユーザー情報詳細 users_path
  def index
  end

#投稿記事一覧 user_path
  def show

  if params[:params_content]
    @find_user = Content.find(params[:id]).user_id
    @contents = find_contents(@find_user).order("id DESC").page(params[:page]).per(6)
    @article_user = User.find(@find_user)
    @ranking_contents = find_contents(@find_user).order("likes_count DESC")
  else
    # params_user の場合
    @contents = find_contents(params[:id]).order("id DESC").page(params[:page]).per(6)
    @article_user = User.find(params[:id])
    @ranking_contents = find_contents(params[:id]).order("likes_count DESC")
  end

  end

private

  def find_contents(params_id)
    Content.where(user_id: params_id)
  end

  def set_tags
    @tags = ActsAsTaggableOn::Tag.all
  end

end
