class CardsController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_user
  before_action :set_wallet
  before_action :set_card, only: [:destroy]

  def index
    @cards = @wallet.cards
  end

  def new
    @card = @wallet.cards.new
  end

  def show
  end 

  def create
    @card = @wallet.cards.new(card_params)
    if @card.save
      redirect_to wallet_path, notice: "Card was successfully created."
    else
      render :new
    end
  end

  def destroy
    @card.destroy
    redirect_to delet_wallet_path, notice: "Card was successfully deleted."
  end

  private

  def set_wallet
    @wallet = Wallet.find_by(wallet_id: params[:wallet_id])
  end

  def set_card
    @card = @wallet.cards.find_by(id: params[:id])
  end

  def card_params
    params.require(:card).permit(:name, :number, :expiration_date, :cvv, :wallet_id)
  end

  def set_user
    @user = Current.user
  end 
end
