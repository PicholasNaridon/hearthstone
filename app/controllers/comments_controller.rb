class CommentsController < ApplicationController
  def create
    @deck = Deck.find(params[:deck_id])
    @user = current_user
    @comment = Comment.new(comment_params)
    @comment.deck = @deck
    @comment.user = @user
    if @comment.save
      flash[:notice] = "Comment successfully saved!!"
      redirect_to deck_path(@deck)
    else
      flash[:notice] = "Comment did not save."
      redirect_to deck_path(@deck)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :rating)
  end

  def authorize_user
    if !user_signed_in?
      flash[:notice] = "Please log in to use this feature"
      redirect_to new_user_session_path
    end
  end
end
