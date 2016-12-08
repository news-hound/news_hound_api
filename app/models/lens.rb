class Lens < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :blacklists

  def evaluate(article)
    

  end
end
