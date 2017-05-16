class Annonce < ApplicationRecord
  validates :titre, :descr, :createur, presence: true
end
