# == Schema Information
#
# Table name: blacklists
#
#  id         :integer          not null, primary key
#  domain     :string
#  message    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Blacklist < ApplicationRecord
  validates :domain, :lens_id, :message, presence: true

  belongs_to :lens
  belongs_to :domain

end
