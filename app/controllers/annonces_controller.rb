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
    if (connecte? && (admin_connecte? || (sessions[:utilisateur_id] == @annonce.createur)))
      @secteur = Secteur.all
    else
      redirect_to root_path
    end
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
    if(connecte?)
      @annonce = Annonce.new
      @secteur = Secteur.all
    else
      redirect_to root_path
    end
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
    if(connecte? && (admin_connecte? || (sessions[:utilisateur_id] == @annonce.createur)))
      Annonce.find(params[:id]).destroy
    end
    redirect_to Annonce
  end

  def accepter
    @annonce = Annonce.find(params[:id])
    if(connecte? && pro_connecte?)
      @annonce.update preneur: session[:utilisateur_id]
    end
    redirect_to @annonce
  end

  def annuler
    @annonce = Annonce.find(params[:id])
    if(connecte? && ((session[:utilisateur_id] == @annonce.createur) || (session[:utilisateur_id] == @annonce.preneur) || admin_connecte?))
      @annonce.update preneur: nil
    end
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
