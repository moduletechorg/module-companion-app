require 'csv'
require 'devise'

desc "Invite and populate accounts for nonlandowners that we have data for"
task :invite_nonlandowner_entries, [:file_path] => :environment do |t, args|
  full_path = "#{Dir.pwd}/#{args.file_path}"
  table = CSV.read("#{full_path}", headers: true)
  puts "name, email, invite_link"
  table.each do |row|

    user_budget = nil
    budget = row["budget"]
    if budget
      budget = budget.to_s
      split_budget = budget.split('')
      budget_array = split_budget[-4..-2]
      user_budget = budget_array.join('').to_i
    end

    user_mortgage = nil
    mortgage = row["pre_approved_mortgage"]
    if mortgage
      if mortgage == "Yes"
        user_mortgage = true
      elsif mortgage == "No"
        user_mortgage = false
      end
    end

    user = User.invite!(email: row["email"], first_name: row["first_name"], housing_option: row["housing_option"], state: row["state"], city: row["city"], preferred_bedroom: row["preferred_bedroom"].to_i, preferred_bathroom: row["preferred_bathroom"].to_f, move_in_time: row["move_in_time"], budget: user_budget, skip_invitation: true)
    puts "#{user.first_name}, #{user.email}, http://app.modulehousing.com/d/users/invitation/accept?invitation_token=#{user.raw_invitation_token}"
  end
end
