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

require 'test_helper'

class BlacklistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
