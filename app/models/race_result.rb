# == Schema Information
# Schema version: 20110307235511
#
# Table name: race_results
#
#  id          :integer         not null, primary key
#  match_id    :integer
#  finisher_id :integer
#  place       :integer
#  created_at  :datetime
#  updated_at  :datetime
#  points      :integer
#

class RaceResult < ActiveRecord::Base
  attr_accessible :match_id, :finisher_id, :place, :points

	has_one :race_relation, :primary_key => "match_id", :foreign_key => "event_id", :conditions => proc { "pilot_id = #{finisher_id}" }
	has_one :race, :primary_key => "match_id", :foreign_key => "id"
	has_one :driver, :primary_key => "finisher_id", :foreign_key => "id"

	acts_as_list :column => :place

  validates :match_id, :presence => true
  validates :finisher_id, :presence => true
  validates :place, :presence => true
	validates :points, :presence => true

	class << self
		def custom_create(race, driver, finish)
			d_id = Driver.find_by_name(driver).id
			create!(:match_id => race, :finisher_id => d_id, :place => finish)
		end

		def init_race(race)
			i = 1
			Driver.all.each do |driver|				
				create!(:match_id => race.id, :finisher_id => driver.id, :place => i, :points => 1)
				i += 1
			end
		end

		def make_standings
			return group("finisher_id").order("sum_points desc").limit(User.count * 2).sum(:points)
		end

		def completed_races
			return RaceResult.group("match_id").count.count
		end
	end
end
