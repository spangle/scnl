# == Schema Information
# Schema version: 20110302213926
#
# Table name: drivers
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  number     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Driver < ActiveRecord::Base
  attr_accessible :name, :number

  has_many :race_relations,		:dependent => :destroy,
														:foreign_key => "pilot_id"
  has_many :race_results,		:dependent => :destroy,
														:foreign_key => "finisher_id"

  driver_regex = /\A[\d]*\z/

  validates :name,		:presence => true,
										:length   => { :maximum => 50 }
  validates :number,	:length			=> { :maximum => 5 },
	                   :format			=> { :with => driver_regex }

	def points
		race_results.sum(:points)
	end

	def race_wins
		race_results.where(:place => 1)
	end

	def race_tops
		race_results.where("place > 0 and place < 10")
	end
end
