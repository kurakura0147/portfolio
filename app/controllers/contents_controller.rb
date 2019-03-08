class ContentsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show, :search, :mypage ]
  before_action :find_contents, only: [:show, :edit, :update, :destroy]

  def index
    @contents = Content.all
    @ranking_contents = Content.order("likes_count DESC")
  end

  def new
    @contents = Content.new
  end

  def create
    @contents = Content.new(params_content)
    @contents.save!
    redirect_to root_path
  end

  def show
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
      @contents = Content.where('name LIKE(?)', "%#{params[:search]}%")
      @count = @contents.count
  end

  private

  def params_content
    params.require(:content).permit(:name, :text, :image, :tag_list).merge(user_id: current_user.id )
  end

  def find_contents
    @contents = Content.find(params[:id])
  end

end

