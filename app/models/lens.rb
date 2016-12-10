class Lens < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :blacklists
  has_many :concepts

  has_many :domains,
    through: :blacklists,
    source: :domain

end
