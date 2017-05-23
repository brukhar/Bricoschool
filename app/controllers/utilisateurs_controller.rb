class UtilisateursController < ApplicationController
  def index
    @utilisateur = Utilisateur.all
  end

  def show
    @utilisateur = Utilisateur.find(params[:id])
    if(@utilisateur.secteur)
      @secteur = Secteur.find(@utilisateur.secteur)
    end
  end

  def new
    @utilisateur = Utilisateur.new
  end

  def create
    @utilisateur = Utilisateur.new(utilisateur_params)
    if @utilisateur.save

      log_in(@utilisateur)

      if(@utilisateur.compte != "consommateur")
        redirect_to edit_utilisateur_path(@utilisateur)
      else
        redirect_to @utilisateur
      end
    else
      render 'new'
    end
  end

  def edit
    @utilisateur = Utilisateur.find(params[:id])
    @secteur = Secteur.all
    if !connecte?
      redirect_to @utilisateur
    end
  end

  def update
    @utilisateur = Utilisateur.find(params[:id])
    if @utilisateur.update_attributes(params.require(:utilisateur).permit(:email, :numero, :secteur, :descr, :logo))
      redirect_to @utilisateur
    else
      @secteur = Secteur.all
      render 'edit'
    end
  end

  private

    def utilisateur_params
      params.require(:utilisateur).permit(:nom, :prenom, :email, :numero, :descr, :logo, :compte, :password,
                                   :password_confirmation)
    end
end
