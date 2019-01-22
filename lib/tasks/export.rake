namespace :export do
  desc "Outputs Neighborhood.all for seeds.rb format."

  task :seeds_format => :environment do
    Neighborhood.order(:id).all.each do |neighborhood|
      puts "Neighborhood.create(#{neighborhood.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end

    Land.order(:id).all.each do |land|
      puts "Land.create(#{land.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end
  end
end
