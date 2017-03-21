class DecksController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @decks = Deck.all
    
  end

  def show
    @deck = Deck.find(params[:id])
    @creator = @deck.user
    @cards = @deck.cards
  end

  def new
    @deck = Deck.new
    @user = current_user
  end

  def create
    @deck = Deck.new(deck_params)
    @deck.user = current_user
    if @deck.save
      flash[:notice] = "Deck created"
      redirect_to deck_path(@deck)
    else
      flash[:notice] = "Please login!"
      redirect_to new_user_session_url
    end
  end

  def edit
    @deck = Deck.find(params[:id])
  end

  def update
    @deck = Deck.find(params[:id])
    if @deck.update_attributes(deck_params)
      flash[:notice] = 'Your deck name has been updated'
      redirect_to @deck
    else
      render 'edit'
    end
  end

  def destroy
    @deck = Deck.find(params[:id])
    @deck.destroy
    flash[:notice] = 'Deck has been deleted'
    redirect_to decks_path
  end


  def add_card
    authenticate_user!
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
    @card = Card.find(params[:id])
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
