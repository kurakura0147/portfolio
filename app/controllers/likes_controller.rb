class LikesController < ApplicationController

  before_action :set_content, only: [:create, :destroy]

  def show
    @user_likes =Like.where(user_id: current_user.id)
    @likes = @user_likes.pluck(:content_id)
    @like_contents =Content.where(id: @likes).page(params[:page]).per(6)
  end

  def create
    @like = Like.new(user_id: current_user.id, content_id: params[:content_id])
    @like.save!
    @likes = Like.where(content_id: params[:content_id])
    @content.reload
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, content_id: params[:content_id])
    like.destroy
    @likes = Like.where(content_id: params[:content_id])
    @content.reload
  end

  private

  def set_content
    @content = Content.find(params[:content_id])
  end

end
