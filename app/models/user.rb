# == Schema Information
# Schema version: 20110303204836
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  nickname           :string(255)
#  email              :string(255)
#  encrypted_password :string(255)
#  salt               :string(255)
#  admin              :boolean
#  created_at         :datetime
#  updated_at         :datetime
#

class User < ActiveRecord::Base
  attr_accessor   :password
  attr_accessible :name, :email, :nickname, :password, :password_confirmation

  has_many :race_relations,		:dependent => :destroy,
															:foreign_key => "owner_id"
  has_many :races,						:foreign_key => "selector_id"
  has_many :message_posts,		:dependent => :destroy,
															:foreign_key => "poster_id"

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name,  :presence => true,
                    :length   => { :maximum => 50 }
  validates :nickname,		:presence => true,
                    			:length   => { :maximum => 50 }
  validates :email, :presence   => true,
                    :format     => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => { :within => 6..40 }

  before_save :encrypt_password

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

	def race_wins
		wins = []
		race_relations.each do |relation|
			result = RaceResult.where("finisher_id = ? and match_id = ? and place = 1", relation.pilot_id, relation.event_id)
			if !result.empty?
				wins << result.first
			end
		end
		return wins
	end

	def race_results
		entries = []
		race_relations.each do |relation|
			result = RaceResult.where("finisher_id = ? and match_id = ?", relation.pilot_id, relation.event_id)
			if !result.empty?
				entries << result.first
			end
		end
		return entries
	end

  class << self
    def authenticate(email, submitted_password)
      user = find_by_email(email)
      (user && user.has_password?(submitted_password)) ? user : nil
    end
    
    def authenticate_with_salt(id, cookie_salt)
      user = find_by_id(id)
      (user && user.salt == cookie_salt) ? user : nil
    end
  end

  private
  
    def encrypt_password
      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(password)
    end
  
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end
    
    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end
    
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end
