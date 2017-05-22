class BonType < ActiveModel::Validator
  def validate(record)
    if !(record.compte == "consommateur" || record.compte == "professionnel" || record.compte == "admin")
      record.errors[:base] << "Type de compte incorrect"
    end
  end
end

class Utilisateur < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :nom, :prenom, presence: true, length: { maximum: 20}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                  format: { with: VALID_EMAIL_REGEX },
                  uniqueness: { case_sensitive: false }
  validates :numero, presence: true, length: { is: 10 },
                  numericality: { only_integer: true },
                  uniqueness: { case_sensitive: false }
  validates :compte, presence: true
  validates_with BonType
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  dragonfly_accessor :logo
end
