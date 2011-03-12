# == Schema Information
# Schema version: 20110307224703
#
# Table name: races
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  location    :string(255)
#  selector_id :integer
#  racedate    :date
#  created_at  :datetime
#  updated_at  :datetime
#  track       :string(255)
#

class Race < ActiveRecord::Base
  attr_accessible :name, :track, :location, :selector_id, :racedate

  has_many :race_relations,		:dependent => :destroy,
														:foreign_key => "event_id"
  has_many :race_results,		:dependent => :destroy,
														:foreign_key => "match_id",
														:order => "race_results.place"
	has_one  :user,						:primary_key => "selector_id", :foreign_key => "id"

  validates :name,				:presence	=> true,
												:length		=> { :maximum => 50 }
	validates :location,		:presence	=> true
  validates :selector_id,		:presence	=> true
  validates :racedate,	:presence	=> true

	def winning_result
		if !race_results.empty?
			result = race_results.where("place = ?", 1)
			if !result.empty?
				return result.first
			else
				return nil
			end
		else
			return nil
		end
	end

	def winning_driver
		if !winning_result.nil?
			return winning_result.driver
		else
			return nil
		end
	end

	def winning_relation
		if !race_relations.nil? and !winning_driver.nil?
			relation = race_relations.where("race_relations.pilot_id = ?", winning_driver.id)
			if !relation.empty?
				return relation.first
			else
				return nil
			end
		else
			return nil
		end
	end

	def winning_user
		if !winning_relation.nil?
			return winning_relation.user
		else
			return nil
		end
	end

	def isSelector?(user)
		return selector_id == user.id
	end

	class << self
		def prev3
			return where("racedate < ?", Date.today).order("racedate desc").limit(3)
		end

		def next_race
			return where("racedate >= ?", Date.today).order("racedate asc").limit(1)
		end
	end
end
