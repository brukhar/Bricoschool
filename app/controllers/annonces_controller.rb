class AnnoncesController < ApplicationController
  def index
    @annonce = Annonce.all
  end

  def show
    @annonce = Annonce.find(params[:id])
    @createur = Utilisateur.find(@annonce.createur)
    if(@annonce.preneur)
      @preneur = Utilisateur.find(@annonce.preneur)
    end
  end

  def edit
    @annonce = Annonce.find(params[:id])
  end

  def update
    @annonce = Annonce.find(params[:id])
    if (@annonce.update_attributes(params.require(:annonce).permit(:titre, :descr, :logo)))
      @annonce.save
      redirect_to @annonce
    else
      render 'edit'
    end
  end

  def new
  end

  def create
    if(connecte?)
      @annonce = Annonce.new(params.require(:annonce).permit(:titre, :descr, :logo))
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
    @annonce = Annonce.find(params[:id])
    @annonce.update preneur: session[:utilisateur_id]
    redirect_to @annonce
  end

  def annuler
    @annonce = Annonce.find(params[:id])
    @annonce.update preneur: nil
    redirect_to @annonce
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
