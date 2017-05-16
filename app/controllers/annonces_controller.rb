class AnnoncesController < ApplicationController
  def index
    @annonce = Annonce.all
  end

  def show
    @annonce = Annonce.find(params[:id])
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
end
