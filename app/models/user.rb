# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  first_name  :string
#  last_name   :string
#  email       :string
#  profile_pic :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class User < ApplicationRecord
  def full_name
    [first_name, last_name].map(&:titlecase).join(" ")
  end

  def self.profile_pic
    ["/assets/demo/img/profile-pics/1.jpg","/assets/demo/img/profile-pics/2.jpg","/assets/demo/img/profile-pics/3.jpg","/assets/demo/img/profile-pics/4.jpg","/assets/demo/img/profile-pics/5.jpg","/assets/demo/img/profile-pics/6.jpg","/assets/demo/img/profile-pics/8.jpg","/assets/demo/img/profile-pics/9.jpg"].sample
  end
end
