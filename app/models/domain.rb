class Domain < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :blacklists

  has_many :lenses,
    through: :blacklists,
    source: :lens
end
