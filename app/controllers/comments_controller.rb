class CommentsController < ApplicationController

  def create
    # @prototype = Prototype.find(params[:user_id])
    # @comment = Prototype.new(comment_params)
    # Comment.create(comment_params)
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype)
      "  # コメントと結びつくツイートの詳細画面に遷移する"
    else
      @prototype = @comment.prototype
      # @comment = @prototype.comments
      render "prototypes/show"
    end

  end





  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id,prototype_id: params[:prototype_id])
    # 引数の大文字小文字でエラーの原因となる。理由を確認
  end
end
