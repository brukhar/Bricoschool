class AnnoncesController < ApplicationController
  def index
    @annonce = Annonce.all
  end

  def show
    @annonce = Annonce.find(params[:id])
  end

  def new
  end

  def create
    @annonce = Annonce.new(params.require(:annonce).permit(:titre, :descr))

    @annonce.save
    redirect_to @annonce
  end
end
