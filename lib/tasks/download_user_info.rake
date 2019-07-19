require 'csv'
require 'devise'
require 'aws-sdk-s3'

desc "Download user profile info and lot view info"
task :download_user_info => :environment do
  users = User.all.order('id')

  headers = ["first_name", "last_name", "email", "state", "city", "housing_option", "bedroom", "bathroom", "timeline", "budget", "feedback", "sign_in_count", "last_sign_in_at"]

  lots = Land.all
  lot_visits = {}
  lots.each do |l|
    headers.push(l.address)
    lot_visits[l.id] = 0
  end
  puts headers

  filename = Rails.root.join('tmp').to_s + "/userinfo.csv"
  CSV.open(filename, "wb") do |csv|
    csv << headers
    users.each do |u|
      user_events = Ahoy::Event.where(["user_id = ? and name = 'Viewed Lot'", u])

      line = [u.first_name, u.last_name, u.email, u.state, u.city, u.housing_option, u.preferred_bedroom, u.preferred_bathroom, u.move_in_time, u.budget, u.feedback, u.sign_in_count, u.last_sign_in_at]

      user_events.each do |visit|
        lot_id = "#{visit.properties['id']}".to_i
        if !(lot_visits[lot_id] == nil)
          lot_visits[lot_id] += 1
        end
      end

      lot_visits.each do |lot, visit_count|
        line.push(visit_count)
      end

      puts line

      csv << line

      lot_visits.each do |lot, visit_count |
        lot_visits[lot] = 0
      end

    end

  end

  Aws.config.update({
      credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_KEY_ID'])
  })
  s3 = Aws::S3::Resource.new(region:'us-east-1')

  obj = s3.bucket(ENV['AWS_BUCKET']).object('userinfo.csv')
  obj.upload_file(filename)

  puts obj.public_url

end
