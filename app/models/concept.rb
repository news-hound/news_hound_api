class Concept < ApplicationRecord
  validates :lens_id, :message, :keywords, presence: true

  after_initialize :ensure_lower_case!

  belongs_to :lens

  private

  def ensure_lower_case!
    self.keywords.map!(&:downcase)
  end

end
