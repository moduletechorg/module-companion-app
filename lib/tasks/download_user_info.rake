require 'csv'
require 'devise'

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
  puts lot_visits

  CSV.open("download_user_info_DEV.csv", "w") do |csv|
    csv << headers
    users.each do |u|
      user_events = Ahoy::Event.where(["user_id = ? and name = 'Viewed Lot'", u])

      puts u.email
      puts u.id
      puts "number of events: #{user_events.count}"

      line = [u.first_name, u.last_name, u.email, u.state, u.city, u.housing_option, u.preferred_bedroom, u.preferred_bathroom, u.move_in_time, u.budget, u.feedback, u.sign_in_count, u.last_sign_in_at]

      puts lot_visits
      user_events.each do |visit|
        lot_id = "#{visit.properties['id']}".to_i
        if !(lot_visits[lot_id] == nil)
          lot_visits[lot_id] += 1
          puts "Lot id: #{lot_id}; num_visits: #{lot_visits[lot_id]}"
        end
      end

      lot_visits.each do |lot, visit_count|
        line.push(visit_count)
      end

      csv << line

      lot_visits.each do |lot, visit_count |
        lot_visits[lot] = 0
      end
    end
  end

end
