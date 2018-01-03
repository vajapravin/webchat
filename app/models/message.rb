# == Schema Information
#
# Table name: messages
#
#  id           :integer          not null, primary key
#  content      :text
#  is_delivered :boolean          default(FALSE)
#  group_id     :integer
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Message < ApplicationRecord
  belongs_to :group
  belongs_to :sender, class_name: 'User', foreign_key: :user_id

  def sent_at
    created_at.strftime("%d/%m/%Y %H:%M")
  end
end
