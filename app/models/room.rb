class Room < ActiveRecord::Base
	before_create :set_token
	validates :status, presence: true

	def set_token
		self.token = SecureRandom.urlsafe_base64(32, false)
	end
end
