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




  private

  def params_content
    params.require(:content).permit(:name, :image, :text)
    # .merge(user_id: current_user.id )

  end



end

