class BonType < ActiveModel::Validator
  def validate(record)
    if !(record.compte == "consommateur" || record.compte == "professionnel" || record.compte == "admin")
      record.errors[:base] << "Type de compte incorrect"
    end
  end
end

class Utilisateur < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :nom, :prenom, :email, :numero, presence: { message: "est absent" }
  validates :nom, :prenom, length: { maximum: 20, message: "est trop long"}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 255 },
                  format: { with: VALID_EMAIL_REGEX, message: "n'est pas valide" },
                  uniqueness: { case_sensitive: false, message: "est déjà inscrit" }
  validates :numero, length: { is: 10, message: "n'a pas la bonne taille" },
                  numericality: { only_integer: true, message: "n'est pas un numéro" },
                  uniqueness: { case_sensitive: false, message: "existe déjà" }
  validates :compte, presence: true
  validates_with BonType
  has_secure_password
  validates :password, length: { minimum: 6, message: "est trop court (au moins 6 caractères)" }, allow_nil: true
  dragonfly_accessor :logo
end
