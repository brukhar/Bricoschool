class Secteur < ApplicationRecord
  validates :nom, presence: { message: "est absent" }, uniqueness: { message: "existe déjà" }
end
