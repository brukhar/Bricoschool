class Annonce < ApplicationRecord
  validates :titre, :descr, :createur, :secteur, presence: { message: "est absent" }
  dragonfly_accessor :logo
end
