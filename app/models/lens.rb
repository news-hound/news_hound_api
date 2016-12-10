class Lens < ApplicationRecord
  validates :name, :session_token, :password_digest, presence: true
  validates :name, :session_token, uniqueness: true

  has_many :blacklists
  has_many :concepts

  has_many :domains,
    through: :blacklists,
    source: :domain

  before_validation :ensure_session_token!

  def self.find_by_credentials(name, password)
    lens = find_by(name: name)
    return nil if lens.nil?
    lens.has_password?(password) ? lens : nil
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def has_password?(password)
    bc_obj = BCrypt::Password.new(self.password)
    bc_obj.is_password?(password)
  end

  private

  def ensure_session_token!
    self.session_token ||= SecureRandom.urlsafe_base64(128)
  end

end
