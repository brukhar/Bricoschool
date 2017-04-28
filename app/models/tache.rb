class Tache < ApplicationRecord
  validates :nom, :prix, :temps, :branche, presence: true
  belongs_to :BranchePro
end
