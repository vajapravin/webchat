# == Schema Information
#
# Table name: groups
#
#  id          :integer          not null, primary key
#  name        :string
#  user_id     :integer
#  is_public   :boolean          default(TRUE)
#  channel_key :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
