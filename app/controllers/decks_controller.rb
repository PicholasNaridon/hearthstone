class DecksController < ApplicationController
  before_action :authorize_user, except: [:index, :show]

  def index
    @decks = Deck.all
  end

  def show
    @deck = Deck.find(params[:id])
    @creator = @deck.user
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
      flash[:notice] = @deck.errors.full_messages
      render :new
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
