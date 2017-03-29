class DecksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authorize_user, except: [:index, :show]

  def index
    @decks = Deck.all
  end

  def show
    @deck = Deck.find(params[:id])
    @creator = @deck.user
    @cards = @deck.cards
    @comment = Comment.new
    @comments = @deck.comments
    @comments_start = 0
  end

  def new
    @deck = Deck.new
    @user = current_user
  end

  def create
    !authorize_user
    @deck = Deck.new(deck_params)
    @deck.user = current_user
    if @deck.save
      flash[:notice] = "Deck created"
      redirect_to deck_path(@deck)
    else
      flash[:notice] = "Deck not saved"
      render :new
    end
  end

  def destroy
    @deck = Deck.find(params[:id])
    @deck.destroy
    flash[:notice] = 'Deck has been deleted'
    redirect_to decks_path
  end

  def add_card
    @deck = Deck.find(params[:id])
    @copies = @deck.cards.where({id: params[:card]})
    @allcards = @deck.cards
    if @copies.length <2 && @allcards.length < 30
      @deck.cards.push(Card.find(params[:card]))
    end
    redirect_to @deck
  end

  def delete_card
    @deck = Deck.find(params[:id])
    @card = Card.find(params[:card])
    @delete = IncludesCard.find_by({card_id: params[:card], deck_id: params[:id]})
    @delete.destroy
    redirect_to deck_path(@deck), notice: "Deleted"
  end


  private

  def deck_params
    params.require(:deck).permit(:name, :user)
  end

  def authorize_user
    if !user_signed_in?
      flash[:notice] = "Please log in to use this feature"
      redirect_to new_user_session_path
    end
  end
end
