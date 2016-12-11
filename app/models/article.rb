class Article < ApplicationRecord
  #TODO uniqueness constraint
  validates :url, presence: true

  belongs_to :lens
end
