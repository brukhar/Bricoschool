class UtilisateursController < ApplicationController
  def index
    @utilisateur = Utilisateur.all
  end

  def show
    @utilisateur = Utilisateur.find(params[:id])
  end

  def new
    @utilisateur = Utilisateur.new
  end

  def create
    @utilisateur = Utilisateur.new(utilisateur_params)
    if @utilisateur.save
      redirect_to @utilisateur
    else
      render 'new'
    end
  end

  def edit
    @utilisateur = Utilisateur.find(params[:id])
    if !connecte?
      redirect_to @utilisateur
    end
  end

  def update
    @utilisateur = Utilisateur.find(params[:id])
    if @utilisateur.update_attributes(params.require(:utilisateur).permit(:email, :numero, :descr, :logo))
      redirect_to @utilisateur
    else
      render 'edit'
    end
  end

  private

    def utilisateur_params
      params.require(:utilisateur).permit(:nom, :prenom, :email, :numero, :descr, :logo, :compte, :password,
                                   :password_confirmation)
    end
end
