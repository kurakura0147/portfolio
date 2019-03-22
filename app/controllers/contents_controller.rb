class ContentsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show, :search, :mypage ]
  before_action :find_contents, only: [:show, :edit, :update, :destroy]
  before_action :set_tags

  def index
    @contents = Content.all.includes(:user).order("id DESC").page(params[:page]).per(6)
    @ranking_contents = Content.order("likes_count DESC")
  end

  def new
    @contents = Content.new
  end

  def create
    @contents = Content.create(params_content)
    redirect_to root_path
  end

  def show
    @comments = @contents.comments.includes(:user).order("id DESC")
  end

  def edit
  end

  def update
    @contents.update(params_content)
    redirect_to content_path
  end

  def destroy
    @contents.destroy
    redirect_to root_path
  end

  def mypage
  end

  def search
    if params[:params_name]
      @contents = Content.where('name LIKE(?)', "%#{params[:search]}%")
      @count = @contents.count
      @contents = @contents.page(params[:page]).per(6)
    else
      @search_tag = ActsAsTaggableOn::Tag.find_by(name: params[:search]).id
      @search_content = ActsAsTaggableOn::Tagging.where(tag_id: @search_tag).pluck(:taggable_id)
      @contents = Content.where(id: @search_content)
      @count = @contents.count
      @contents = @contents.page(params[:page]).per(6)
    end


  end

  private

  def params_content
    params.require(:content).permit(:name, :text, :image, :tag_list).merge(user_id: current_user.id )
  end

  def find_contents
    @contents = Content.find(params[:id])
  end

  def set_tags
    @tags = ActsAsTaggableOn::Tag.most_used(20)
  end

end

