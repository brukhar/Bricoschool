module SessionsHelper
  def log_in(utilisateur)
    session[:utilisateur_id] = utilisateur.id
  end

  def log_out
    session[:utilisateur_id] = nil
  end

  def utilisateur_courant
    @utilisateur_courant ||= Utilisateur.find_by(id: session[:utilisateur_id])
  end

  def connecte?
    !utilisateur_courant.nil?
  end

  def pro_connecte?
    utilisateur_courant.compte != "consommateur"
  end

  def admin_connecte?
    utilisateur_courant.compte == "admin"
  end
end
