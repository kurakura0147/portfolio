class CommentsController < ApplicationController

def new
  @comments = Comment.new
end

def create
  @comments = Comment.create(params_comment)
  redirect_to content_path(id: params_comment[:content_id])
end

def destroy

end


private

  def params_comment
    params.permit(:com, :user_id, :content_id)
  end

end
