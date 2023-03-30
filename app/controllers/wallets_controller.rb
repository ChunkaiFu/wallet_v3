class WalletsController < ApplicationController
  before_action :require_user_logged_in!

  def new
    @wallet = Wallet.new
  end

  def index
    user = Current.user
    @wallet = Wallet.find_by(user_id: user.id)
    @cards = @wallet.cards
  end

  def create 
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      @wallet=Wallet.new(wallet_params)
        if @wallet.save 
            redirect_to wallets_path, notice: "Successfully created account!"
        else 
            render :new 
        end 
    else 
      flash[:alert] = "Try again"
      render :new
    end 
  end 

  private

  def wallet_params
    params.require(:wallet).permit(:balance, :currency, :user_id)
  end

end

