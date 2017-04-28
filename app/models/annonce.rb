class Annonce < ApplicationRecord
  validates :titre, :descr, presence: true
end
