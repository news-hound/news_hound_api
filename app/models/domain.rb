class Domain < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :blacklists

  has_many :lenses,
    through: :blacklists,
    source: :lens

  before_validation :ensure_name_format!

  def self.find_by_url(url)
    Domain.find_by(name: extract_name(url))
  end

  private

  def ensure_name_format!
    self.name = Domain.extract_name(self.name)
  end

  # Remove the protocol prefix and query string from url


  # Extract the domain from the url
  def self.extract_name(url)
    url = url.gsub("http://", "").gsub("https://", "")
    root = ""
    idx = 0

    until url[idx] == "/" || idx == url.length
      root << url[idx]
      idx += 1
    end

    root
  end
end
