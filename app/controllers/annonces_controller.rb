class AnnoncesController < ApplicationController
  def index
    @annonce = Annonce.all
  end

  def show
    @annonce = Annonce.find(params[:id])
    @createur = Utilisateur.find(@annonce.createur)
    @preneur = Utilisateur.find(@annonce.preneur)
  end

  def edit
    @annonce = Annonce.find(params[:id])
  end

  def update
    @annonce = Annonce.find(params[:id])
    @annonce.update_attributes(params.require(:annonce).permit(:titre, :descr))

    redirect_to @annonce
  end

  def new
  end

  def create
    if(connecte?)
      @annonce = Annonce.new(params.require(:annonce).permit(:titre, :descr))
      @annonce.createur = utilisateur_courant.id

      @annonce.save
    end
    redirect_to @annonce
  end

  def destroy
    Annonce.find(params[:id]).destroy
    redirect_to Annonce
  end

  def accepter
    Annonce.find(params[:id]).update preneur: session[:utilisateur_id]
    redirect_to Annonce
  end

  def annuler
    Annonce.find(params[:id]).update preneur: nil
    redirect_to Annonce
  end

  def miennes
    if !connecte?
      redirect_to Annonce
    end
    @annonce = Annonce.all
  end

  def travaux
    if !connecte? || !pro_connecte?
      redirect_to Annonce
    end
    @annonce = Annonce.all
  end
end
