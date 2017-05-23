class SecteurController < ApplicationController
  def new
    if(connecte? && admin_connecte?)
      @secteur = Secteur.new
    else
      redirect_to annonces_path
    end
  end

  def create
    if(connecte? && admin_connecte?)
      @secteur = Secteur.new(params.require(:secteur).permit(:nom))

      if !@secteur.save
        render 'new'
      else
        redirect_to annonces_path
      end
    else
      redirect_to annonces_path
    end
  end

end
