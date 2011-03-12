# == Schema Information
# Schema version: 20110303204836
#
# Table name: race_relations
#
#  id         :integer         not null, primary key
#  event_id   :integer
#  owner_id   :integer
#  pilot_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class RaceRelation < ActiveRecord::Base
  attr_accessible :event_id, :owner_id, :pilot_id

	has_one :race_result, :primary_key => "event_id", :foreign_key => "match_id", :conditions => proc { "finisher_id = #{pilot_id}" }
	has_one :race, :primary_key => "event_id", :foreign_key => "id"
	has_one :user, :primary_key => "owner_id", :foreign_key => "id"
	has_one :driver, :primary_key => "pilot_id", :foreign_key => "id"

  validates :event_id, :presence => true
  validates :owner_id, :presence => true
  validates :pilot_id, :presence => true

	class << self
		def custom_create(race, user, driver)
			create!(:event_id => race, :owner_id => user, :pilot_id => Driver.find_by_name(driver).id)
		end

		def init_race(race)
			shuffled = RaceResult.make_standings.keys.shuffle
			(1..User.count).each do |i|
				(0..1).each do |j|
					create!(:event_id => race.id, :owner_id => i, :pilot_id => shuffled[2*i-2+j])
				end
			end
		end
	end
end
