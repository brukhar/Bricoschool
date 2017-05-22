class Annonce < ApplicationRecord
  validates :titre, :descr, :createur, presence: true
  dragonfly_accessor :logo
end
