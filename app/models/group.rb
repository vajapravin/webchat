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

class Group < ApplicationRecord
  before_create :generate_channel_key

  belongs_to :user
  has_many :group_users

  has_many :messages

  private
  def generate_channel_key
    self.channel_key = rand(36**10).to_s(36)
  end
end
