class AnnoncesController < ApplicationController
  def index
    @annonce = Annonce.all
    @secteur = Secteur.all
  end

  def show
    @annonce = Annonce.find(params[:id])
    @createur = Utilisateur.find(@annonce.createur)
    if(@annonce.preneur)
      @preneur = Utilisateur.find(@annonce.preneur)
    end
    if(@annonce.secteur)
      @secteur = Secteur.find(@annonce.secteur)
    end
  end

  def search
    @annonce = Annonce.where( secteur: params[:secteur] )
    @secteur = Secteur.all
    render 'index'
  end

  def edit
    @annonce = Annonce.find(params[:id])
    @secteur = Secteur.all
  end

  def update
    @annonce = Annonce.find(params[:id])
    if (@annonce.update_attributes(params.require(:annonce).permit(:titre, :descr, :secteur, :logo)))
      @annonce.save
      redirect_to @annonce
    else
      @secteur = Secteur.all
      render 'edit'
    end
  end

  def new
    @annonce = Annonce.new
    @secteur = Secteur.all
  end

  def create
    if(connecte?)
      @annonce = Annonce.new(params.require(:annonce).permit(:titre, :secteur, :descr, :logo))
      @annonce.createur = utilisateur_courant.id

      if !@annonce.save
        @secteur = Secteur.all
        render 'new'
      else
        redirect_to @annonce
      end
    else
      redirect_to @annonce
    end
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
