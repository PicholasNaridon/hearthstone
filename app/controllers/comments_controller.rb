class CommentsController < ApplicationController
  def create
    @deck = Deck.find(params[:deck_id])
    @user = current_user
    @comment = Comment.new(comment_params)
    @comment.deck = @deck
    @comment.user = @user
    if @comment.save
      flash[:notice] = "Review successfully saved!!"
      redirect_to deck_path(@deck)
    else
      flash[:notice] = "Review did not save."
      redirect_to deck_path(@deck)
    end
  end

  def edit
    @deck = Deck.find(params[:deck_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @deck = Deck.find(params[:deck_id])
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to @deck, notice: "comment was updated"
    else
      render :edit
    end
  end

  def destroy
    @deck = Deck.find(params[:deck_id])
    @comment = Comment.find_by(user: current_user, deck: @deck)
    @comment.destroy
    redirect_to deck_path(@deck), notice: "Deleted"
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
