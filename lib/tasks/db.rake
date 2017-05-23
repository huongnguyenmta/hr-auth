namespace :db do
  desc "remake database data"
  task remake_data: :environment do

    # if Rails.env.production?
    #   puts "Not running in 'Production' task"
    # else
      %w[db:drop db:create db:migrate].each do |task|
        Rake::Task[task].invoke
      end

      user = User.create name: "Nguyen Binh Dieu", email: "nguyen.binh.dieu@framgia.com", password: 12345678, password_confirmation: 12345678
      user.clients.create name: "CRB", app_id: "c550483e49706ba821bccc6bac3f3b1e", app_secret: "3b438b7cd973829cfa5233396968267c6c7aef298374561e6d4b4dc26c510b5c"

      user_hash = JSON.parse(File.read(Rails.root.join('lib/tasks/data.json')))

      user_hash.each do |huser|
        user = User.find_or_initialize_by(email: huser["email"]).tap do |user|
          user.name = huser[:name]

          if user.new_record?
            user.password = 12345678
            user.password_confirmation = 12345678
          end
        end
        user.save
      end
  end
end
