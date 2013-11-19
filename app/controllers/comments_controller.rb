class CommentsController < ApplicationController

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    load_table
    @comment = @table.comment.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to tables_path, notice: 'Comment created successfully'
    else
      flash.now.alert = "Comment can not be created. Please try again!"
      render :action => :show
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :table_id)
  end

  def load_table
    @table = Table.find(params[:table_id])
  end
end
