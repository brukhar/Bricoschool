class Admin < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :mdp, presence: true, length: { in: 6..20,
    too_short: "Votre mot de passe doit contenir plus de 6 caractères",
    too_long: "Votre mot de passe doit contenir moins de 20 caractères"}
end
