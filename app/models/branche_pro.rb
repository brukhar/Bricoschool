class BranchePro < ApplicationRecord
  validates :nom, presence: true
  has_many :Tache
end
