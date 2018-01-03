namespace :dummy do
  namespace :data do
    desc "Load the generated dummy data into the current environment's database."
    task :import => :environment do
      (0..40).each_slice(4) do |a|
        group_admin = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, profile_pic: User.profile_pic)
        group = Group.create(name: Faker::Pokemon.name, is_public: true, user_id: group_admin.id)
        GroupUser.create(group_id: group.id, user_id: group_admin.id)
        a.each do |i|
          user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, profile_pic: User.profile_pic)
          GroupUser.create(group_id: group.id, user_id: user.id)
        end
      end
    end
  end
end