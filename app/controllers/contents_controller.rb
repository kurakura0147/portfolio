class ContentsController < ApplicationController

  def index
    @contents = Content.all
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
    @contents = Content.find(params[:id])
  end

  def edit
    @contents = Content.find(params[:id])
  end

  def update
    @contents = Content.find(params[:id])
    @contents.update(params_content)
    redirect_to content_path
  end

  def destroy
    @contents = Content.find(params[:id])
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
    params.require(:content).permit(:name, :text, :image)
    # .merge(user_id: current_user.id )
  end



end

