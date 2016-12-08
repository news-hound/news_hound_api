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
  validates :domain, :message, presence: true
  validates :domain, uniqueness: true

  belongs_to :lens
end
