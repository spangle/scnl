class MessagePost < ActiveRecord::Base
  attr_accessible :subject, :message

	has_one :user, :primary_key => "poster_id", :foreign_key => "id"

  validates :subject,  		:presence => true,
                    			:length   => { :maximum => 100 }
  validates :message,			:presence => true

	class << self
		def prev3
			where("created_at < ?", Time.now).order("created_at desc").limit(3)
		end
	end
end
